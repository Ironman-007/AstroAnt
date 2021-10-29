'use strict';
function onButtonClick() {
    let filters = [];

    let filterService = document.querySelector('#service').value;
    if (filterService.startsWith('0x')) {
      filterService = parseInt(filterService);
    }
    if (filterService) {
      filters.push({services: [filterService]});
    }
  
    let filterName = document.querySelector('#name').value;
    if (filterName) {
      filters.push({name: filterName});
    }
  
    let filterNamePrefix = document.querySelector('#namePrefix').value;
    if (filterNamePrefix) {
      filters.push({namePrefix: filterNamePrefix});
    }
  
    let options = {};
    if (document.querySelector('#allDevices').checked) {
      options.acceptAllDevices = true;
    } else {
      options.filters = filters;
    }

    navigator.bluetooth.requestDevice(options)

}