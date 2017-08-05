var assert = require('assert');

describe('Form API Examples / AJAX form', function() {
    it('should load a second Select list after selecting the Temperature at the first Select list', () => {
        browser.url('/examples/fapi-example/ajax-demo');
        const temperatureSelectSelector = '#edit-temperature';
        const colorSelectSelector = 'select[name=color]';

        // Initiall, only one Select is visible.
        browser.waitForVisible(temperatureSelectSelector);
        browser.waitForVisible(colorSelectSelector, 200, true);

        // Selecting the first Select list.
        browser.selectByValue(temperatureSelectSelector, 'warm')

        // Loads the second Select list by AJAX.
        browser.waitForVisible(colorSelectSelector);
    });
});

