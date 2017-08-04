var assert = require('assert');

describe('login page', function() {
    it('should not allow an anonymous user with wrong credentials to login', () => {
        browser.url('/user/login');

        browser.waitForVisible('.name');
        browser.setValueSafe('.name', 'wrong-name');
        browser.setValueSafe('.pass', 'wrong-pass');
        browser.submitForm('.user');

        browser.waitForVisible('.error.messages');
    });
});

