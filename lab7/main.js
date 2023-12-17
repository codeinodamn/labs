 var display = document.getElementById('display');
            var operand1 = '';
            var operand2 = '';
            var operator = '';
            var result = '';

            function appendToDisplay(value) {
                if (result !== '') {
                    clearDisplay();
                    result = '';
                }
                display.value += value;
            }

            function clearDisplay() {
                display.value = '';
            }

            function backspace() {
                display.value = display.value.slice(0, -1);
            }

            function changeSign() {
                display.value = -parseFloat(display.value);
            }

            function operation(op) {
                operand1 = display.value;
                operator = op;
                clearDisplay();
            }

            function calculate() {
                operand2 = display.value;
                switch (operator) {
                    case '+':
                        result = parseFloat(operand1) + parseFloat(operand2);
                        break;
                    case '-':
                        result = parseFloat(operand1) - parseFloat(operand2);
                        break;
                    case '*':
                        result = parseFloat(operand1) * parseFloat(operand2);
                        break;
                    case '/':
                        result = parseFloat(operand1) / parseFloat(operand2);
                        break;
                }
                display.value = result;
            }

            function inverse() {
                display.value = 1 / parseFloat(display.value);
            }

            function squareRoot() {
                display.value = Math.sqrt(parseFloat(display.value));
            }

            function percentage() {
                display.value = parseFloat(display.value) / 100;
            }