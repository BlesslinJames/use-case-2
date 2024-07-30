<!DOCTYPE html>
<html>
<head>
    <title>All Associates' Today's Tasks Pie Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h2 {
            color: #333;
            margin-top: 20px;
        }
        .chart-container {
            width: 80%;
            max-width: 600px;
            margin: 20px 0;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .chart-container canvas {
            width: 100% !important;
            height: auto !important;
        }
        .no-data-message {
            text-align: center;
            font-size: 1.2em;
            color: #666;
        }
    </style>
</head>
<body>
    <h2>All Associates' Today's Tasks</h2>
    <div class="chart-container">
        <canvas id="allTasksPieChart"></canvas>
        <div class="no-data-message" id="noDataMessage" style="display: none;">
            No Data Available
        </div>
    </div>
    <script>
        fetch('AllDailyChartServlet')
            .then(response => response.json())
            .then(data => {
                const labels = Object.keys(data);
                const values = Object.values(data);

                if (labels.length === 0) {
                    document.getElementById('noDataMessage').style.display = 'block';
                    return;
                }

                const ctx = document.getElementById('allTasksPieChart').getContext('2d');
                new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: labels,
                        datasets: [{
                            data: values,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.6)',
                                'rgba(54, 162, 235, 0.6)',
                                'rgba(255, 206, 86, 0.6)',
                                'rgba(75, 192, 192, 0.6)',
                                'rgba(153, 102, 255, 0.6)',
                                'rgba(255, 159, 64, 0.6)',
                                'rgba(255, 99, 71, 0.6)',
                                'rgba(75, 0, 130, 0.6)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)',
                                'rgba(255, 99, 71, 1)',
                                'rgba(75, 0, 130, 1)'
                            ],
                            borderWidth: 2
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'top',
                                labels: {
                                    color: '#333',
                                    font: {
                                        size: 14
                                    }
                                }
                            },
                            title: {
                                display: true,
                                text: "All Associates' Tasks Distribution for Today",
                                color: '#333',
                                font: {
                                    size: 18
                                }
                            }
                        }
                    }
                });
            })
            .catch(error => {
                console.error('Error fetching data:', error);
                document.getElementById('noDataMessage').style.display = 'block';
            });
    </script>
</body>
</html>
