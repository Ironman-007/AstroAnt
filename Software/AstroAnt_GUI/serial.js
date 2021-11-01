/*
 * @license
 * Getting Started with Web Serial Codelab (https://todo)
 * Copyright 2019 Google Inc. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License
 */
'use strict';

let port;
let reader;
let cmd;

const toplogc = document.getElementById("Toplog");
const no_serialport_btn = document.getElementById('no_serialport_btn');
const serialport_btn = document.getElementById('serialport_btn');

if ("serial" in navigator) {
  // alert("Your browser supports serial Web API!");
}

document.addEventListener('DOMContentLoaded', () => {
  no_serialport_btn.addEventListener('click', clickConnect);
  serialport_btn.addEventListener('click', clickConnect);
});

/**
 * @name connect
 * Opens a Web Serial connection to a micro:bit and sets up the input and
 * output stream.
 */
async function connect() {
  // CODELAB: Add code to request & open port here.
  port = await navigator.serial.requestPort();
  await port.open({ baudRate: 115200 });

  reader = port.readable.getReader();
  readLoop();
}


/**
 * @name disconnect
 * Closes the Web Serial connection.
 */
async function disconnect() {
//   drawGrid(GRID_OFF);
//   sendGrid();
  let now = new Date();
  toplogc.textContent = toplogc.textContent +  "disconnecting...." + "\n";

  // CODELAB: Close the input stream (reader).
  if (reader) {
    await reader.cancel();
    // await inputDone.catch(() => {});
    reader = null;
    // inputDone = null;
  }

  // CODELAB: Close the output stream.

  // CODELAB: Close the port.
  await port.close();
  port = null;

}


/**
 * @name clickConnect
 * Click handler for the connect/disconnect button.
 */
async function clickConnect() {

  // CODELAB: Add disconnect code here.
  if (port) {
    await disconnect();
    toggleUIConnected(false);
    return;
  }

  // CODELAB: Add connect code here.
  toplogc.textContent = toplogc.textContent + "connecting..." + "\n";
  await connect();

  toggleUIConnected(true);
}

/**
 * @name readLoop
 * Reads data from the input stream and displays it on screen.
 */
async function readLoop() {
  // CODELAB: Add read loop here.
  // Listen to data coming from the serial device.
  while (true) {
    const { value, done } = await reader.read();
    if (value) {
      cmd = String.fromCharCode(value);
      toplogc.textContent = toplogc.textContent + cmd + '\n';
    //   log.textContent += cmd + '\n';
    }
    if (done) {
      toplogc.textContent = toplogc.textContent + '[readLoop] DONE' + done + "\n";
      reader.releaseLock();
      break;
    }
  }  
}

/**
 * @name sendGrid
 * Iterates over the checkboxes and generates the command to set the LEDs.
 */
function sendGrid() {
  // CODELAB: Generate the grid

}

/**
 * @name writeToStream
 * Gets a writer from the output stream and send the lines to the micro:bit.
 * @param  {...string} lines lines to send to the micro:bit
 */
function writeToStream(...lines) {
  // CODELAB: Write to output stream

}


/**
 * @name watchButton
 * Tells the micro:bit to print a string on the console on button press.
 * @param {String} btnId Button ID (either BTN1 or BTN2)
 */
function watchButton(btnId) {
  // CODELAB: Hook up the micro:bit buttons to print a string.

}


/**
 * @name LineBreakTransformer
 * TransformStream to parse the stream into lines.
 */
class LineBreakTransformer {
  constructor() {
    // A container for holding stream data until a new line.
    this.container = '';
  }

  transform(chunk, controller) {
    // CODELAB: Handle incoming chunk
    this.container += chunk;
    const lines = this.container.split('\r\n');
    this.container = lines.pop();
    lines.forEach(line => controller.enqueue(line));

  }

  flush(controller) {
    // CODELAB: Flush the stream.
    controller.enqueue(this.container);

  }
}


/**
 * @name JSONTransformer
 * TransformStream to parse the stream into a JSON object.
 */
class JSONTransformer {
  transform(chunk, controller) {
    // CODELAB: Attempt to parse JSON content

  }
}


/**
 * @name buttonPushed
 * Event handler called when one of the micro:bit buttons is pushed.
 * @param {Object} butEvt
 */
function buttonPushed(butEvt) {
  // CODELAB: micro:bit button press handler

}


/**
 * The code below is mostly UI code and is provided to simplify the codelab.
 */

function initCheckboxes() {
  ledCBs.forEach((cb) => {
    cb.addEventListener('change', () => {
      sendGrid();
    });
  });
}

function drawGrid(grid) {
  if (grid) {
    grid.forEach((v, i) => {
      ledCBs[i].checked = !!v;
    });
  }
}

function toggleUIConnected(connected) {
  if (connected) {
    toplogc.textContent = toplogc.textContent + 'Serialport Connected' + "\n";
    hideSerialConnectBtn();
  }
  else {
    toplogc.textContent = toplogc.textContent + "Serialport disconnected" + "\n";
    showSerialConnectBtn()
  }
}

function hideSerialConnectBtn() {
  no_serialport_btn.style.display = "none"; //disable reconnect button
  serialport_btn.style.display = "block"; //disable reconnect button
}

function showSerialConnectBtn() {
  no_serialport_btn.style.display = "block"; //disable reconnect button
  serialport_btn.style.display = "none"; //disable reconnect button
}