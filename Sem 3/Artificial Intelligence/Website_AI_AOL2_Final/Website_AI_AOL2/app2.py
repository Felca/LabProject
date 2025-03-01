from flask import Flask, render_template, Response, jsonify
import cv2
import numpy as np
from tensorflow.keras.models import load_model #type: ignore

app = Flask(__name__)

model = load_model('model_final.h5')
face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')

labels_dict = {0: 'Angry', 1: 'Disgust', 2: 'Fear', 3: 'Happy', 4: 'Neutral', 5: 'Sad', 6: 'Surprise'}
emotion_counts = {label: 0 for label in labels_dict.values()}

# Video stream
def generate_frames():
    video = cv2.VideoCapture(0)
    while True:
        success, frame = video.read()
        if not success:
            break
        
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        faces = face_cascade.detectMultiScale(gray, 1.3, 5)

        for x, y, w, h in faces:
            face_img = gray[y:y+h, x:x+w]
            resized = cv2.resize(face_img, (48, 48))
            normalized = resized / 255.0
            reshaped = np.reshape(normalized, (1, 48, 48, 1))

            result = model.predict(reshaped)
            label = np.argmax(result, axis=1)[0]
            emotion_counts[labels_dict[label]] += 1

            cv2.rectangle(frame, (x, y), (x+w, y+h), (255, 200, 100), 2)
            cv2.putText(frame, labels_dict[label], (x, y-10), 
                        cv2.FONT_HERSHEY_SIMPLEX, 0.8, (255, 255, 255), 2)
        
        # Encode frame for streaming
        _, buffer = cv2.imencode('.jpg', frame)
        frame = buffer.tobytes()

        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')

    video.release()

@app.route('/video_feed')
def video_feed():
    return Response(generate_frames(), mimetype='multipart/x-mixed-replace; boundary=frame')

# start counting emotion
@app.route('/start_emotion_detection', methods=['GET'])
def start_emotion_detection():
    # Reset
    global emotion_counts
    emotion_counts = {label: 0 for label in labels_dict.values()}
    return jsonify({"message": "Emotion detection started"})

# get it in percentage
@app.route('/get_emotion_summary', methods=['GET'])
def get_emotion_summary():
    total_counts = sum(emotion_counts.values())
    if total_counts > 0:
        emotion_percentages = [{"label": emotion, "percentage": round((count / total_counts) * 100, 2)} 
                               for emotion, count in emotion_counts.items()]
    else:
        emotion_percentages = [{"label": emotion, "percentage": 0} for emotion in emotion_counts]
    return jsonify(emotion_percentages)

# render html
@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)