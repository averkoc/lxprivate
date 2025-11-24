<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>16-Channel Remote Controller</title>
    <style>
        .container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
        }
        .button {
            padding: 20px;
            background-color: #008CBA;
            color: white;
            text-align: center;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.2em;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #005f73;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">16-Channel Remote Controller</h1>
    <div class="container">
        <div class="button">1</div>
        <div class="button">2</div>
        <div class="button">3</div>
        <div class="button">4</div>
        <div class="button">5</div>
        <div class="button">6</div>
        <div class="button">7</div>
        <div class="button">8</div>
        <div class="button">9</div>
        <div class="button">10</div>
        <div class="button">11</div>
        <div class="button">12</div>
        <div class="button">13</div>
        <div class="button">14</div>
        <div class="button">15</div>
        <div class="button">16</div>
    </div>
</body>
</html>
