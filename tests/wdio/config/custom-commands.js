'use strict';

const assert = require('assert');

module.exports = function (browser, capabilities, specs) {

  browser.addCommand('login', (user) => {
    assert(user, "login command must be passed a username")
    browser.url('/user/login');
    browser.waitForVisible('#user-login');
    browser.setValueSafe('#edit-name', user);
    browser.setValueSafe('#edit-pass', '1234');
    browser.submitForm('#user-login');
    browser.waitForVisible('.role-authenticated-user');
  });

  browser.addCommand('logout', () => {
    browser.url('/user/logout');
    browser.waitForVisible('body.role-anonymous-user');
  });

  // Set the window size to avoid clipping things off.
  browser.windowHandleSize({
    width: 1500,
    height: 900
  });

}

