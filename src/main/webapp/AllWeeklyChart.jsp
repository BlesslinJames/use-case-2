<!DOCTYPE html>
<html>
<head>
    <title>Weekly Tasks/Hours Bar Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h2>Weekly Tasks/Hours Bar Chart</h2>
    <canvas id="AllWeeklyChart" width="400" height="400"></canvas>
    <script>
        fetch('AllWeeklyChartServlet')
        .then(response => response.json())
        .then(data => {
            const ctx = document.getElementById('AllWeeklyChart').getContext('2d');

            const labels = [];
            const datasetMap = {};

            data.datasets.forEach(item => {
                if (!labels.includes(item.day)) {
                    labels.push(item.day);
                }
                if (!datasetMap[item.username]) {
                    datasetMap[item.username] = [];
                }
                datasetMap[item.username].push({
                    x: item.day,
                    y: item.duration
                });
            });

            const datasets = Object.keys(datasetMap).map(username => ({
                label: username,
                data: datasetMap[username],
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }));

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: datasets
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        });
    </script>
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
