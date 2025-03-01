let sessionRunning = false;

document.getElementById('homeLink').addEventListener('click', function() {
    document.getElementById('landingPage').scrollIntoView({
        behavior: 'smooth',
        block: 'start'
    });
});

document.getElementById('resultLink').addEventListener('click', function() {
    document.getElementById('resultPage').scrollIntoView({
        behavior: 'smooth',
        block: 'start'
    });
});

function startSession() {
    document.getElementById('startSessionBtn').style.display = 'none';
    document.getElementById('endSessionBtn').style.display = 'block';

    fetch('/start_emotion_detection')
        .then(response => response.json())
        .then(data => {
            console.log('Session started:', data);
            alert('Session started! Camera and AI are running.');
            // document.getElementById('startSessionBtn').style.display = 'none';
            // document.getElementById('endSessionBtn').style.display = 'block';
            document.getElementById('cameraFeed').style.display = 'block';
            sessionRunning = true;
        })
        .catch(error => console.error('Error starting session:', error));
}

function endSession() {
    document.getElementById('startSessionBtn').style.display = 'block';
    document.getElementById('endSessionBtn').style.display = 'none';

    // summary --> from json file display it with barchart 
    fetch('/get_emotion_summary')
        .then(response => response.json())
        .then(data => {
            console.log('Emotion summary:', data);
            displayChart(data);
            alert('Session ended! Results are displayed.');
            // document.getElementById('endSessionBtn').style.display = 'none';
            document.getElementById('cameraFeed').style.display = 'none';
            document.getElementById('resultPage').style.display = 'flex';
            sessionRunning = false;
        })
        .catch(error => console.error('Error fetching emotion summary:', error));
}

// separte x, y values and style the chart
function displayChart(data) {
    const xValues = data.map(item => item.label);
    const yValues = data.map(item => item.percentage);
    const barColors = ["#F25E5E", "#0FAE32", "#AE7FFB", "#FFB153", "#818181", "#83AEF3", "#E581DD"];

    new Chart("emotionChart", {
        type: 'bar',
        data: {
            labels: xValues,
            datasets: [{
                backgroundColor: barColors,
                data: yValues
            }]
        },
        options: {
            legend: { display: false }
        }
    });
}
