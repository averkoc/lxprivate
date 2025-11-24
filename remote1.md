<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relay Control</title>
    <style>
        body {
            text-align: center; /* Centers all text by default */
        }

        h2 {
            text-align: center; /* Centers the heading */
        }

        .accordion-container {
            width: 50%;
            margin: 0 auto; /* Centers the container */
            box-sizing: border-box; /* Ensures padding is included in the width */
            text-align: left; /* Ensures text inside the container is left-aligned */
        }

        .accordion {
            cursor: pointer;
            padding: 10px;
            background-color: #f1f1f1;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
            transition: 0.4s;
            width: 100%;
            box-sizing: border-box; /* Ensures padding is included in the width */
        }

        .panel {
            padding: 0 18px;
            display: none;
            background-color: white;
            overflow: hidden;
            width: 100%;
            box-sizing: border-box; /* Ensures padding is included in the width */
        }

        .button-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 10px;
            padding: 10px;
            width: 100%;
            box-sizing: border-box; /* Ensures padding is included in the width */
        }

        .button {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%; /* Ensures buttons take full width of grid cell */
            padding: 10px;
            background-color: #4CAF50; /* Default color for ON state */
            color: white;
            cursor: pointer;
            text-align: center;
            font-size: 14px;
            box-sizing: border-box; /* Ensures padding is included in the width */
        }

        .button.off {
            background-color: #f44336; /* Color for OFF state */
        }

        .button .channel-label {
            pointer-events: none; /* Ensures label is not clickable */
        }

        /* Mobile responsiveness */
        @media (max-width: 600px) {
            .accordion-container {
                width: 90%; /* Increase width for smaller screens */
            }
            
            .button-container {
                grid-template-columns: 1fr; /* Stack buttons in a single column */
            }
        }
    </style>
</head>
<body>

<h2>Relay Control</h2>

<div class="accordion-container">
    <!-- Relay Module 1 -->
    <button class="accordion">Relay Module 1</button>
    <div class="panel" id="relay1">
        <div class="button-container">
            <div class="button on" onclick="handleClick('relay1', 1)">
                <span class="channel-label">CH 1</span>
            </div>
            <div class="button on" onclick="handleClick('relay1', 2)">
                <span class="channel-label">CH 2</span>
            </div>
            <div class="button on" onclick="handleClick('relay1', 3)">
                <span class="channel-label">CH 3</span>
            </div>
            <div class="button on" onclick="handleClick('relay1', 4)">
                <span class="channel-label">CH 4</span>
            </div>
            <div class="button on" onclick="handleClick('relay1', 5)">
                <span class="channel-label">CH 5</span>
            </div>
            <div class="button on" onclick="handleClick('relay1', 6)">
                <span class="channel-label">CH 6</span>
            </div>
            <div class="button on" onclick="handleClick('relay1', 7)">
                <span class="channel-label">CH 7</span>
            </div>
            <div class="button on" onclick="handleClick('relay1', 8)">
                <span class="channel-label">CH 8</span>
            </div>
        </div>
    </div>

    <!-- Relay Module 2 -->
    <button class="accordion">Relay Module 2</button>
    <div class="panel" id="relay2">
        <div class="button-container">
            <div class="button on" onclick="handleClick('relay2', 1)">
                <span class="channel-label">CH 1</span>
            </div>
            <div class="button on" onclick="handleClick('relay2', 2)">
                <span class="channel-label">CH 2</span>
            </div>
            <div class="button on" onclick="handleClick('relay2', 3)">
                <span class="channel-label">CH 3</span>
            </div>
            <div class="button on" onclick="handleClick('relay2', 4)">
                <span class="channel-label">CH 4</span>
            </div>
            <div class="button on" onclick="handleClick('relay2', 5)">
                <span class="channel-label">CH 5</span>
            </div>
            <div class="button on" onclick="handleClick('relay2', 6)">
                <span class="channel-label">CH 6</span>
            </div>
            <div class="button on" onclick="handleClick('relay2', 7)">
                <span class="channel-label">CH 7</span>
            </div>
            <div class="button on" onclick="handleClick('relay2', 8)">
                <span class="channel-label">CH 8</span>
            </div>
        </div>
    </div>
</div>

<script>
    // JavaScript for accordion functionality
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.display === "block") {
                panel.style.display = "none";
            } else {
                panel.style.display = "block";
            }
        });
    }

    function handleClick(relayId, channel) {
        const relayContainer = document.getElementById(relayId);
        const button = relayContainer.querySelector(`.button:nth-child(${channel})`);
        const isOn = button.classList.contains('on');
        button.classList.toggle('on', !isOn);
        button.classList.toggle('off', isOn);
        // Add your handling code here
        console.log(`Relay: ${relayId}, Channel: ${channel}, State: ${isOn ? 'OFF' : 'ON'}`);
    }
</script>

</body>
</html>
