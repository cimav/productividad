/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/journal_articles.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/journal_articles.js":
/*!**************************************************!*\
  !*** ./app/javascript/packs/journal_articles.js ***!
  \**************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

/* WEBPACK VAR INJECTION */(function(Bulma) {$(document).on("turbolinks:load", function () {
  console.log(Bulma);
});
alert('mp');
$(document).on('change', '#journal_article_status', function () {
  v = $(this).val();

  if (v == 1) {
    // SENT
    $('.accepted-status').hide();
    $('.published-status').hide();
  } else if (v == 2) {
    // ACCEPTED
    $('.accepted-status').show();
    $('.published-status').hide();
  } else if (v == 3) {
    // PUBLISHED
    $('.accepted-status').show();
    $('.published-status').show();
  } else if (v == 99) {
    // REJECTED
    $('.accepted-status').hide();
    $('.published-status').hide();
  }
});
/* WEBPACK VAR INJECTION */}.call(this, __webpack_require__(/*! @vizuaalog/bulmajs/src/bulma */ "./node_modules/@vizuaalog/bulmajs/src/bulma.js")))

/***/ }),

/***/ "./node_modules/@vizuaalog/bulmajs/src/bulma.js":
/*!******************************************************!*\
  !*** ./node_modules/@vizuaalog/bulmajs/src/bulma.js ***!
  \******************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./core */ "./node_modules/@vizuaalog/bulmajs/src/core.js");
/* harmony import */ var _plugins_notification__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./plugins/notification */ "./node_modules/@vizuaalog/bulmajs/src/plugins/notification.js");
/* harmony import */ var _plugins_navbar__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./plugins/navbar */ "./node_modules/@vizuaalog/bulmajs/src/plugins/navbar.js");
/* harmony import */ var _plugins_message__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./plugins/message */ "./node_modules/@vizuaalog/bulmajs/src/plugins/message.js");
/* harmony import */ var _plugins_dropdown__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./plugins/dropdown */ "./node_modules/@vizuaalog/bulmajs/src/plugins/dropdown.js");
/* harmony import */ var _plugins_modal__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ./plugins/modal */ "./node_modules/@vizuaalog/bulmajs/src/plugins/modal.js");
/* harmony import */ var _plugins_alert__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ./plugins/alert */ "./node_modules/@vizuaalog/bulmajs/src/plugins/alert.js");
/* harmony import */ var _plugins_file__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! ./plugins/file */ "./node_modules/@vizuaalog/bulmajs/src/plugins/file.js");
/* harmony import */ var _plugins_tabs__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! ./plugins/tabs */ "./node_modules/@vizuaalog/bulmajs/src/plugins/tabs.js");
/* harmony import */ var _plugins_accordion__WEBPACK_IMPORTED_MODULE_9__ = __webpack_require__(/*! ./plugins/accordion */ "./node_modules/@vizuaalog/bulmajs/src/plugins/accordion.js");
/* harmony import */ var _plugins_calendar__WEBPACK_IMPORTED_MODULE_10__ = __webpack_require__(/*! ./plugins/calendar */ "./node_modules/@vizuaalog/bulmajs/src/plugins/calendar.js");
/* eslint no-unused-vars: 0 */











/* harmony default export */ __webpack_exports__["default"] = (_core__WEBPACK_IMPORTED_MODULE_0__["default"]);

/***/ }),

/***/ "./node_modules/@vizuaalog/bulmajs/src/core.js":
/*!*****************************************************!*\
  !*** ./node_modules/@vizuaalog/bulmajs/src/core.js ***!
  \*****************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
var Bulma = {
  /**
   * Current BulmaJS version.
   * @type {String}
   */
  VERSION: '0.10.2',

  /**
   * An index of the registered plugins
   * @type {Object}
   */
  plugins: {},

  /**
   * Helper method to create a new plugin.
   * @param  {String} key The plugin's key
   * @param  {Object} options The options to be passed to the plugin
   * @return {Object} The newly created plugin instance
   */
  create: function create(key, options) {
    if (!key || !Bulma.plugins.hasOwnProperty(key)) {
      throw new Error('[BulmaJS] A plugin with the key \'' + key + '\' has not been registered.');
    }

    return Bulma.plugins[key].handler.create(options);
  },

  /**
   * Register a new plugin
   * @param  {String} key The key to register the plugin under
   * @param  {Object} plugin The plugin's main constructor
   * @param  {number?} priority The priority this plugin has over other plugins. Higher means the plugin is registered before lower.
   * @return {undefined}
   */
  registerPlugin: function registerPlugin(key, plugin) {
    var priority = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 0;

    if (!key) {
      throw new Error('[BulmaJS] Key attribute is required.');
    }

    this.plugins[key] = {
      priority: priority,
      handler: plugin
    };
  },

  /**
   * Parse the HTML DOM searching for data-bulma attributes. We will then pass
   * each element to the appropriate plugin to handle the required processing.
   * 
   * @return {undefined}
   */
  traverseDOM: function traverseDOM() {
    var _this = this;

    var root = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : document;
    var elements = root.querySelectorAll(this.getPluginClasses());
    this.each(elements, function (element) {
      if (element.hasAttribute('data-bulma-attached')) {
        return;
      }

      var plugins = _this.findCompatiblePlugins(element);

      _this.each(plugins, function (plugin) {
        plugin.handler.parse(element);
      });
    });
  },

  /**
   * Return a string of classes to search the DOM for
   * @returns {string} The string containing the classes
   */
  getPluginClasses: function getPluginClasses() {
    var classes = [];

    for (var key in this.plugins) {
      if (!this.plugins[key].handler.getRootClass()) {
        continue;
      }

      classes.push('.' + this.plugins[key].handler.getRootClass());
    }

    return classes.join(',');
  },

  /**
   * Search our plugins and find one that matches the element
   * @param {HTMLElement} element The element we want to match for
   * @returns {Object} The plugin that matched
   */
  findCompatiblePlugins: function findCompatiblePlugins(element) {
    var _this2 = this;

    var compatiblePlugins = [];
    var sortedPlugins = Object.keys(this.plugins).sort(function (a, b) {
      return _this2.plugins[a].priority < _this2.plugins[b].priority;
    });
    this.each(sortedPlugins, function (key) {
      if (element.classList.contains(_this2.plugins[key].handler.getRootClass())) {
        compatiblePlugins.push(_this2.plugins[key]);
      }
    });
    return compatiblePlugins;
  },

  /**
   * Create an element and assign classes
   * @param {string} name The name of the element to create
   * @param {array} classes An array of classes to add to the element
   * @return {HTMLElement} The newly created element
   */
  createElement: function createElement(name, classes) {
    if (!classes) {
      classes = [];
    }

    if (typeof classes === 'string') {
      classes = [classes];
    }

    var elem = document.createElement(name);
    this.each(classes, function (className) {
      elem.classList.add(className);
    });
    return elem;
  },

  /**
   * Helper method to normalise a plugin finding an element.
   * @param {string} query The CSS selector to query for
   * @param {HTMLElement|null} context The element we want to search within
   * @param {boolean} nullable Do we except a null response?
   * @returns {null|HTMLElement} The element we found, or null if allowed.
   * @throws {TypeError}
   */
  findElement: function findElement(query) {
    var context = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : document;
    var nullable = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : false;

    if (!query && !nullable) {
      throw new TypeError('First argument to `findElement` required. Null given.');
    }

    if (!query) {
      return null;
    }

    if (query.toString() === '[object HTMLElement]') {
      return query;
    }

    return context.querySelector(query);
  },

  /**
   * Find an element otherwise create a new one.
   * @param {string} query The CSS selector query to find
   * @param {HTMLElement|null} parent The parent we want to search/create within
   * @param {[string]} elemName The name of the element to create
   * @param {[array]} classes The classes to apply to the element
   * @returns {HTMLElement} The HTML element we found or created
   */
  findOrCreateElement: function findOrCreateElement(query) {
    var parent = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : null;
    var elemName = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 'div';
    var classes = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : [];
    var elem = this.findElement(query, parent);

    if (!elem) {
      if (classes.length === 0) {
        classes = query.split('.').filter(function (item) {
          return item;
        });
      }

      var newElem = this.createElement(elemName, classes);

      if (parent) {
        parent.appendChild(newElem);
      }

      return newElem;
    }

    return elem;
  },

  /**
   * For loop helper
   * @param {*} objects The array/object to loop through
   * @param {*} callback The callback used for each item
   */
  each: function each(objects, callback) {
    var i;

    for (i = 0; i < objects.length; i++) {
      callback(objects[i], i);
    }
  }
};
document.addEventListener('DOMContentLoaded', function () {
  if (window.hasOwnProperty('bulmaOptions') && window.bulmaOptions.autoParseDocument === false) {
    return;
  }

  Bulma.traverseDOM();
});
/* harmony default export */ __webpack_exports__["default"] = (Bulma);

/***/ }),

/***/ "./node_modules/@vizuaalog/bulmajs/src/dismissableComponent.js":
/*!*********************************************************************!*\
  !*** ./node_modules/@vizuaalog/bulmajs/src/dismissableComponent.js ***!
  \*********************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "default", function() { return DismissableComponent; });
/* harmony import */ var _plugin__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./plugin */ "./node_modules/@vizuaalog/bulmajs/src/plugin.js");
function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }

function _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return self; }

function _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }

function _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }


/**
 * @module DismissableComponent
 * @since  0.2.0
 * @author  Thomas Erbe <vizuaalog@gmail.com>
 */

var DismissableComponent =
/*#__PURE__*/
function (_Plugin) {
  _inherits(DismissableComponent, _Plugin);

  _createClass(DismissableComponent, null, [{
    key: "defaultOptions",

    /**
     * Returns an object containing the default options for this plugin.
     * @returns {object} The default options object.
     */
    value: function defaultOptions() {
      return {
        isDismissable: false,
        destroyOnDismiss: true,
        element: null
      };
    }
    /**
     * Plugin constructor
     * @param  {string} name Plugin's name
     * @param  {Object} options Plugin's options
     * @return {this} The new plugin instance
     */

  }]);

  function DismissableComponent(name, options) {
    var _this;

    _classCallCheck(this, DismissableComponent);

    _this = _possibleConstructorReturn(this, _getPrototypeOf(DismissableComponent).call(this, options));
    /**
     * The name of this component, this will be used as the root class
     * @type {string}
     */

    _this.name = name;
    /**
    * Body text.
    * @type {string}
    */

    _this.body = _this.option('body');
    /**
    * Color modifier.
    * @type {string} Possible values are null, primary, info, success, warning, danger
    */

    _this.color = _this.option('color');
    /**
    * How long to wait before auto dismissing the component.
    * @type {int|null} If null component must be dismissed manually.
    */

    _this.dismissInterval = _this.option('dismissInterval') ? _this.createDismissInterval(_this.option('dismissInterval')) : null;
    /**
    * Does this component have a dismiss button?
    * @type {Boolean}
    */

    _this.isDismissable = _this.option('isDismissable');
    /**
    * Should this component be destroyed when it is dismissed.
    * @type {Boolean}
    */

    _this.destroyOnDismiss = _this.option('destroyOnDismiss');
    /**
    * The root element.
    * @type {HTMLElement|null} If this is not provided a new element will be created.
    */

    _this.element = _this.option('element');

    if (!_this.element) {
      _this.createRootElement();

      _this.parent.appendChild(_this.element);
    }

    _this.element.setAttribute('data-bulma-attached', 'attached');
    /**
    * The element used to close the component.
    * @type {HTMLElement}
    */


    _this.closeButton = _this.option('closeButton', _this.createCloseButton());

    if (_this.body) {
      _this.insertBody();
    }

    if (_this.color) {
      _this.setColor();
    }

    return _this;
  }
  /**
   * Create the main element.
   * @return {undefined}
   */


  _createClass(DismissableComponent, [{
    key: "createRootElement",
    value: function createRootElement() {
      this.element = document.createElement('div');
      this.element.classList.add(this.name);
      this.hide();
    }
    /**
     * Show the component.
     * @return {undefined}
     */

  }, {
    key: "show",
    value: function show() {
      this.element.classList.remove('is-hidden');
    }
    /**
     * Hide the component.
     * @return {undefined}
     */

  }, {
    key: "hide",
    value: function hide() {
      this.element.classList.add('is-hidden');
    }
    /**
     * Insert the body text into the component.
     * @return {undefined}
     */

  }, {
    key: "insertBody",
    value: function insertBody() {
      this.element.innerHTML = this.body;
    }
    /**
     * Create the element that will be used to close the component.
     * @return {HTMLElement} The newly created close button
     */

  }, {
    key: "createCloseButton",
    value: function createCloseButton() {
      var closeButton = document.createElement('button');
      closeButton.setAttribute('type', 'button');
      closeButton.classList.add('delete');
      return closeButton;
    }
    /**
     * Create an interval to dismiss the component after the set number of ms.
     * @param  {int} interval The time to wait before dismissing the component
     * @return {undefined}
     */

  }, {
    key: "createDismissInterval",
    value: function createDismissInterval(interval) {
      var _this2 = this;

      return setInterval(function () {
        _this2.handleCloseEvent();
      }, interval);
    }
    /**
     * Insert the close button before our content.
     * @return {undefined}
     */

  }, {
    key: "prependCloseButton",
    value: function prependCloseButton() {
      this.element.insertBefore(this.closeButton, this.element.firstChild);
    }
    /**
     * Setup the event listener for the close button.
     * @return {undefined}
     */

  }, {
    key: "setupCloseEvent",
    value: function setupCloseEvent() {
      this.closeButton.addEventListener('click', this.handleCloseEvent.bind(this));
    }
    /**
     * Handle the event when our close button is clicked.
     * @return {undefined}
     */

  }, {
    key: "handleCloseEvent",
    value: function handleCloseEvent() {
      if (this.destroyOnDismiss) {
        this.destroy();
      } else {
        this.hide();
      }
    }
    /**
     * Set the colour of the component.
     * @return {undefined}
     */

  }, {
    key: "setColor",
    value: function setColor() {
      this.element.classList.add('is-' + this.color);
    }
    /**
     * Destroy the component, removing the event listener, interval and element.
     * @return {undefined}
     */

  }, {
    key: "destroy",
    value: function destroy() {
      if (this.closeButton) {
        this.closeButton.removeEventListener('click', this.handleCloseEvent.bind(this));
      }

      clearInterval(this.dismissInterval);
      this.parent.removeChild(this.element);
      this.parent = null;
      this.element = null;
    }
  }]);

  return DismissableComponent;
}(_plugin__WEBPACK_IMPORTED_MODULE_0__["default"]);



/***/ }),

/***/ "./node_modules/@vizuaalog/bulmajs/src/plugin.js":
/*!*******************************************************!*\
  !*** ./node_modules/@vizuaalog/bulmajs/src/plugin.js ***!
  \*******************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "default", function() { return Plugin; });
function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(source, true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(source).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

/**
 * Base plugin class. Provides basic, common functionality.
 * @class Plugin
 * @since 0.7.0
 * @author  Thomas Erbe <vizuaalog@gmail.com>
 */
var Plugin =
/*#__PURE__*/
function () {
  _createClass(Plugin, null, [{
    key: "create",

    /**
     * Helper method used by the Bulma core to create a new instance.
     * @param  {Object?} options The options object for this instance
     * @return {Plugin|boolean} The newly created instance or false if method is not used
     */
    value: function create() {
      return false;
    }
    /**
     * Handle parsing the DOM elements.
     * @param {HTMLElement?} element The root element for this instance
     * @return {Plugin|boolean} The new plugin instance, or false if method is not used
     */

  }, {
    key: "parse",
    value: function parse() {
      return false;
    }
    /**
     * Returns a string containing the element class this plugin supports.
     * @returns {string} The class name.
     * @throws {Error} Thrown if this method has not been replaced.
     */

  }, {
    key: "getRootClass",
    value: function getRootClass() {
      throw new Error('The getRootClass method should have been replaced by the plugin being created.');
    }
    /**
     * Returns an object containing the default options for this plugin.
     * @returns {object} The default options object.
     */

  }, {
    key: "defaultOptions",
    value: function defaultOptions() {
      return {};
    }
    /**
     * Create a plugin.
     * @param {object} options The options for this plugin
     */

  }]);

  function Plugin() {
    var options = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};

    _classCallCheck(this, Plugin);

    this.options = _objectSpread({}, this.constructor.defaultOptions(), {}, options);
    this.parent = this.option('parent', document.body);
  }
  /**
   * Find an option by key.
   * @param {string} key The option key to find.
   * @param {any} defaultValue Default value if an option with key is not found.
   * @returns {any} The value of the option we found, or defaultValue if none found.
   */


  _createClass(Plugin, [{
    key: "option",
    value: function option(key) {
      var defaultValue = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : null;

      if (!this.options.hasOwnProperty(key) || this.options[key] === null) {
        if (typeof defaultValue === 'function') {
          return defaultValue();
        }

        return defaultValue;
      }

      return this.options[key];
    }
  }]);

  return Plugin;
}();



/***/ }),

/***/ "./node_modules/@vizuaalog/bulmajs/src/plugins/accordion.js":
/*!******************************************************************!*\
  !*** ./node_modules/@vizuaalog/bulmajs/src/plugins/accordion.js ***!
  \******************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../core */ "./node_modules/@vizuaalog/bulmajs/src/core.js");
/* harmony import */ var _plugin__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../plugin */ "./node_modules/@vizuaalog/bulmajs/src/plugin.js");
function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }

function _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return self; }

function _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }

function _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }



/**
 * @module Accordion
 * @since  0.3.0
 * @author  Thomas Erbe <vizuaalog@gmail.com>
 */

var Accordion =
/*#__PURE__*/
function (_Plugin) {
  _inherits(Accordion, _Plugin);

  _createClass(Accordion, null, [{
    key: "create",

    /**
     * Helper method used by the Bulma core to create a new instance.
     * @param  {Object} options The plugin's options
     * @return {Accordion} The newly created instance
     */
    value: function create(options) {
      return new Accordion(options);
    }
    /**
     * Handle parsing the DOM.
     * @param {HTMLElement} element The root element for this accordion
     * @return {undefined}
     */

  }, {
    key: "parse",
    value: function parse(element) {
      new Accordion({
        element: element
      });
    }
    /**
     * Returns a string containing the element class this plugin supports.
     * @returns {string} The class name.
     */

  }, {
    key: "getRootClass",
    value: function getRootClass() {
      return 'accordions';
    }
    /**
     * Plugin constructor
     * @param  {Object} options The plugin's options
     * @return {this} The new plugin instance
     */

  }]);

  function Accordion(options) {
    var _this;

    _classCallCheck(this, Accordion);

    _this = _possibleConstructorReturn(this, _getPrototypeOf(Accordion).call(this, options)); // Work out the parent if it hasn't been supplied as an option.

    if (_this.parent === null) {
      _this.parent = _this.option('element').parentNode;
    }
    /**
     * Accordion element.
     * @type {string}
     */


    _this.element = _this.option('element');

    _this.element.setAttribute('data-bulma-attached', 'attached');
    /**
     * Accordion items
     * @type {Array}
     */


    _this.accordions = _this.findAccordions();
    /**
     * Toggle buttons for each accordion item
     * @type {Array}
     */

    _this.toggleButtons = _this.findToggleButtons();

    _this.addToggleButtonEvents();

    return _this;
  }
  /**
   * Find the accordion items within this accordions element
   * @returns {Array} The accordion elements found
   */


  _createClass(Accordion, [{
    key: "findAccordions",
    value: function findAccordions() {
      return this.element.querySelectorAll('.accordion');
    }
    /**
     * Find the toggle buttons within this accordions element
     * @returns {Array} The toggle buttons found
     */

  }, {
    key: "findToggleButtons",
    value: function findToggleButtons() {
      var buttons = [];
      _core__WEBPACK_IMPORTED_MODULE_0__["default"].each(this.accordions, function (accordion) {
        buttons.push(accordion.querySelector('button.toggle'));
      });
      return buttons;
    }
    /**
     * Add click events to toggle buttons
     * @return {undefined}
     */

  }, {
    key: "addToggleButtonEvents",
    value: function addToggleButtonEvents() {
      var _this2 = this;

      _core__WEBPACK_IMPORTED_MODULE_0__["default"].each(this.toggleButtons, function (toggleButton, index) {
        // If the button is null, the accordion item has no toggle button
        if (toggleButton !== null) {
          toggleButton.addEventListener('click', function (event) {
            _this2.handleToggleClick(event, index);
          });
        }
      });
    }
    /**
     * Handle the click
     * @param {Object} event The event object
     * @param {number} index Index of the accordion to toggle
     * @return {undefined}
     */

  }, {
    key: "handleToggleClick",
    value: function handleToggleClick(event, index) {
      this.toggleAccordionVisibility(this.accordions[index]);
    }
    /**
     * Show or hide the accordion
     * @param {HTMLElement} accordion The accordion element
     * @return {undefined}
     */

  }, {
    key: "toggleAccordionVisibility",
    value: function toggleAccordionVisibility(accordion) {
      _core__WEBPACK_IMPORTED_MODULE_0__["default"].each(this.accordions, function (a) {
        a.classList.remove('is-active');
      });

      if (accordion.classList.contains('is-active')) {
        accordion.classList.remove('is-active');
      } else {
        accordion.classList.add('is-active');
      }
    }
    /**
     * Destroy the accordion
     * @return {undefined}
     */

  }, {
    key: "destroy",
    value: function destroy() {
      this.element = null;
    }
  }]);

  return Accordion;
}(_plugin__WEBPACK_IMPORTED_MODULE_1__["default"]);

_core__WEBPACK_IMPORTED_MODULE_0__["default"].registerPlugin('accordion', Accordion);
/* harmony default export */ __webpack_exports__["default"] = (Accordion);

/***/ }),

/***/ "./node_modules/@vizuaalog/bulmajs/src/plugins/alert.js":
/*!**************************************************************!*\
  !*** ./node_modules/@vizuaalog/bulmajs/src/plugins/alert.js ***!
  \**************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../core */ "./node_modules/@vizuaalog/bulmajs/src/core.js");
/* harmony import */ var _modal__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./modal */ "./node_modules/@vizuaalog/bulmajs/src/plugins/modal.js");
function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(source, true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(source).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }

function _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return self; }

function _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }

function _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }



/**
 * @module Alert
 * @since  0.8.0
 * @author  Thomas Erbe <vizuaalog@gmail.com>
 */

var Alert =
/*#__PURE__*/
function (_Modal) {
  _inherits(Alert, _Modal);

  _createClass(Alert, null, [{
    key: "create",

    /**
     * Helper method used by the Bulma core to create a new instance.
     * @param  {Object} options THe options object for the new instance
     * @return {Alert} The newly created instance
     */
    value: function create(options) {
      return new Alert(options);
    }
    /**
     * Get the root class this plugin is responsible for.
     * This element has no HTML only equivelent. So this is not required.
     * @returns {string} The class this plugin is responsible for.
     */

  }, {
    key: "getRootClass",
    value: function getRootClass() {
      return '';
    }
    /**
     * Returns an object containing the default options for this plugin.
     * @returns {object} The default options object.
     */

  }, {
    key: "defaultOptions",
    value: function defaultOptions() {
      return {
        type: 'info',
        title: '',
        body: '',
        confirm: 'Okay',
        cancel: null,
        style: 'card',
        parent: document.body,
        showHeader: true
      };
    }
    /**
     * Plugin constructor
     * @param  {Object} options The options object for this plugin
     * @return {this} The newly created plugin instance
     */

  }]);

  function Alert(options) {
    var _this;

    _classCallCheck(this, Alert);

    _this = _possibleConstructorReturn(this, _getPrototypeOf(Alert).call(this, options));

    _this.element.classList.add('alert');

    _this.open();

    return _this;
  }
  /**
   * Create the alerts structure
   * @returns {void}
   */


  _createClass(Alert, [{
    key: "createCardStructure",
    value: function createCardStructure() {
      if (this.option('showHeader')) {
        /** @param {HTMLElement} */
        this.header = _core__WEBPACK_IMPORTED_MODULE_0__["default"].findOrCreateElement('.modal-card-head', this.content, 'header', ['modal-card-head', 'has-background-' + this.option('type')]);
        /** @param {HTMLElement} */

        var textColor = this.option('type') == 'warning' ? 'black' : 'white';
        this.headerTitle = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('p', ['modal-card-title', 'has-text-' + textColor]);
        this.headerTitle.innerHTML = this.title;
        this.header.appendChild(this.headerTitle);
      }
      /** @param {HTMLElement} */


      this.cardBody = _core__WEBPACK_IMPORTED_MODULE_0__["default"].findOrCreateElement('.modal-card-body', this.content, 'section');

      if (!this.cardBody.innerHTML) {
        this.cardBody.innerHTML = this.body;
      }
      /** @param {HTMLElement} */


      this.footer = _core__WEBPACK_IMPORTED_MODULE_0__["default"].findOrCreateElement('.modal-card-foot', this.content, 'footer');
    }
    /**
     * Go through the provided buttons option and create the buttons.
     * @returns {void}
     */

  }, {
    key: "createButtons",
    value: function createButtons() {
      var _this2 = this;

      var defaultButtonOptions = {
        close: true,
        destroy: true,
        onClick: function onClick(e) {}
      };
      var confirmOptions = this.option('confirm');

      if (typeof confirmOptions === 'string') {
        confirmOptions = {
          label: confirmOptions,
          classes: []
        };
      }

      confirmOptions = _objectSpread({}, defaultButtonOptions, {}, confirmOptions);
      var confirmButton = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('button', ['button', 'is-' + this.option('type')].concat(confirmOptions.classes));
      confirmButton.innerHTML = confirmOptions.label;
      confirmButton.addEventListener('click', function (e) {
        confirmOptions.onClick(e);

        if (confirmOptions.close) {
          _this2.close();
        }

        if (confirmOptions.destory) {
          _this2.destroy();
        }
      });
      this.footer.appendChild(confirmButton);

      if (this.option('cancel')) {
        var cancelOptions = this.option('cancel');

        if (typeof cancelOptions === 'string') {
          cancelOptions = {
            label: cancelOptions,
            classes: []
          };
        }

        cancelOptions = _objectSpread({}, defaultButtonOptions, {}, cancelOptions);
        var cancelButton = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('button', ['button'].concat(cancelOptions.classes));
        cancelButton.innerHTML = cancelOptions.label;
        cancelButton.addEventListener('click', function (e) {
          cancelOptions.onClick(e);

          if (cancelOptions.close) {
            _this2.close();
          }

          if (cancelOptions.destroy) {
            _this2.destroy();
          }
        });
        this.footer.appendChild(cancelButton);
      }
    }
  }]);

  return Alert;
}(_modal__WEBPACK_IMPORTED_MODULE_1__["default"]);

_core__WEBPACK_IMPORTED_MODULE_0__["default"].registerPlugin('alert', Alert);
/* harmony default export */ __webpack_exports__["default"] = (Alert);

/***/ }),

/***/ "./node_modules/@vizuaalog/bulmajs/src/plugins/calendar.js":
/*!*****************************************************************!*\
  !*** ./node_modules/@vizuaalog/bulmajs/src/plugins/calendar.js ***!
  \*****************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../core */ "./node_modules/@vizuaalog/bulmajs/src/core.js");
/* harmony import */ var _plugin__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../plugin */ "./node_modules/@vizuaalog/bulmajs/src/plugin.js");
function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }

function _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return self; }

function _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }

function _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }



/**
 * @module Calendar
 * @since  0.3.0
 * @author  Thomas Erbe <vizuaalog@gmail.com>
 */

var Calendar =
/*#__PURE__*/
function (_Plugin) {
  _inherits(Calendar, _Plugin);

  _createClass(Calendar, null, [{
    key: "create",

    /**
     * Helper method used by the Bulma core to create a new instance.
     * @param  {Object} options The new calendar's options
     * @return {Calendar} The newly created calendar instance
     */
    value: function create(options) {
      return new Calendar(options);
    }
    /**
     * Returns a string containing the element class this plugin supports.
     * @returns {string} The class name.
     */

  }, {
    key: "getRootClass",
    value: function getRootClass() {
      return 'calendar';
    }
    /**
     * Returns an object containing the default options for this plugin.
     * @returns {object} The default options object.
     */

  }, {
    key: "defaultOptions",
    value: function defaultOptions() {
      return {
        date: new Date(),
        months: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
        shortDays: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
        navButtons: true,
        format: 'yyyy-mm-dd',
        overlay: false
      };
    }
    /**
     * Plugin constructor
     * @param  {Object} options Plugin instance's options
     * @return {this} The newly created instance
     */

  }]);

  function Calendar(options) {
    var _this;

    _classCallCheck(this, Calendar);

    _this = _possibleConstructorReturn(this, _getPrototypeOf(Calendar).call(this, options));
    /**
     * The root Calendar element.
     * @type {HTMLElement}
     */

    _this.element = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('div', ['calendar']);
    /**
     * The input element this calendar belongs to.
     * @type {HTMLElement|null}
     */

    _this.isInput = _this.parent.nodeName === 'INPUT';
    /**
     * The current date for today tests
     * @type {Date}
     */

    _this.now = new Date();
    /**
     * The date this calendar starts at
     * @type {Date}
     */

    _this.date = _this.option('date');
    /**
     * The current year for the calendar
     * @type {int}
     */

    _this.year = _this.date.getFullYear();
    /**
     * The current month for the calendar
     * @type {int}
     */

    _this.month = _this.date.getMonth();
    /**
     * Month names
     * @type {Array}
     */

    _this.months = _this.option('months');
    /**
     * Short day names
     * @type {Array}
     */

    _this.shortDays = _this.option('shortDays');
    /**
     * Number of days in each month
     * @type {Array}
     */

    _this.monthDays = [31, _this.isLeapYear(_this.year) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    /**
     * Show the navigating buttons
     * @type {boolean}
     */

    _this.navButtons = _this.option('navButtons');
    /**
     * The format string for the date output. Used when attached to an input element.
     * @type {string}
     */

    _this.format = _this.option('format');
    /**
     * Should the calendar be shown as a modal. Used when attached to an input element
     * @type {boolean}
     */

    _this.overlay = _this.option('overlay');

    if (_this.overlay) {
      _this.buildModal();
    }

    if (_this.isInput) {
      _this.parent.addEventListener('focus', function (event) {
        _this.handleInputFocus(event);
      });
    }

    _this.render();

    return _this;
  } ////////////////////////////////////////
  ///// HELPER METHODS TO BUILD HTML /////
  ////////////////////////////////////////

  /**
   * If we are to show as an overlay, build the modal's HTML
   * @return {undefined}
   */


  _createClass(Calendar, [{
    key: "buildModal",
    value: function buildModal() {
      var _this2 = this;

      this.modal = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('div', ['modal']);
      this.modalBackground = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('div', ['modal-background']);
      var modalClose = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('button', ['modal-close']);
      modalClose.addEventListener('click', function () {
        _this2.modal.classList.remove('is-active');
      });
      this.modal.appendChild(this.modalBackground);
      this.modal.appendChild(modalClose);
      this.element.appendChild(this.modal);
      this.element.style.zIndex = 40;
    }
    /**
     * Build the calendars nav HTML
     * @return {undefined}
     */

  }, {
    key: "buildNav",
    value: function buildNav() {
      var _this3 = this;

      var prevIcon, nextIcon;
      var nav = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('div', 'calendar-nav');
      var navLeft = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('div', 'calendar-nav-left');
      var navRight = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('div', 'calendar-nav-right'); // Left side of nav (prev year/month buttons)

      if (this.navButtons) {
        this.prevYearButton = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('button', ['button', 'is-text']);
        prevIcon = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('i', ['fa', 'fa-backward']);
        this.prevYearButton.appendChild(prevIcon);
        this.prevYearButton.addEventListener('click', function (event) {
          _this3.handlePrevYearClick(event);
        });
        navLeft.appendChild(this.prevYearButton);
        this.prevMonthButton = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('button', ['button', 'is-text']);
        prevIcon = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('i', ['fa', 'fa-chevron-left']);
        this.prevMonthButton.appendChild(prevIcon);
        this.prevMonthButton.addEventListener('click', function (event) {
          _this3.handlePrevMonthClick(event);
        });
        navLeft.appendChild(this.prevMonthButton); // Right side of nav (next year/month buttons)

        this.nextMonthButton = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('button', ['button', 'is-text']);
        nextIcon = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('i', ['fa', 'fa-chevron-right']);
        this.nextMonthButton.appendChild(nextIcon);
        this.nextMonthButton.addEventListener('click', function (event) {
          _this3.handleNextMonthClick(event);
        });
        navRight.appendChild(this.nextMonthButton);
        this.nextYearButton = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('button', ['button', 'is-text']);
        prevIcon = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('i', ['fa', 'fa-forward']);
        this.nextYearButton.appendChild(prevIcon);
        this.nextYearButton.addEventListener('click', function (event) {
          _this3.handleNextYearClick(event);
        });
        navRight.appendChild(this.nextYearButton);
      } // Month/year label


      this.monthYearLabel = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('div');
      this.monthYearLabel.innerHTML = this.months[this.month] + ' ' + this.year;
      nav.appendChild(navLeft);
      nav.appendChild(this.monthYearLabel);
      nav.appendChild(navRight);
      return nav;
    }
    /**
     * Build the calendar's container HTML
     * @return {HTMLElement} The calendar's container
     */

  }, {
    key: "buildContainer",
    value: function buildContainer() {
      return _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('div', 'calendar-container');
    }
    /**
     * Build the calendar's header HTML
     * @return {HTMLElement} The calendar's header element
     */

  }, {
    key: "buildHeader",
    value: function buildHeader() {
      var calendarHeader = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('div', 'calendar-header');
      _core__WEBPACK_IMPORTED_MODULE_0__["default"].each(this.shortDays, function (dayName) {
        var day = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('div', 'calendar-date');
        day.innerHTML = dayName;
        calendarHeader.appendChild(day);
      });
      return calendarHeader;
    }
    /**
     * Build the calendar's body. This includes all days.
     * @return {HTMLElement} The calendar's body element
     */

  }, {
    key: "buildBody",
    value: function buildBody() {
      var _this4 = this;

      var calendarBody = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('div', 'calendar-body');
      var daysInMonth = this.monthDays[this.now.getMonth()]; // Number of days to show from the previous month.

      var daysBefore = new Date(this.year, this.month, 1).getDay(); // Number of days to show from the next month

      var daysAfter;
      var numDays = daysInMonth + daysBefore;
      daysAfter = numDays;

      while (daysAfter > 7) {
        daysAfter -= 7;
      }

      numDays += 7 - daysAfter;
      var cells = [];

      for (var i = 0; i < numDays; i++) {
        var d = new Date(this.year, this.month, 1 + (i - daysBefore));
        var today = false;
        var thisMonth = false;

        if (d.getFullYear() === this.now.getFullYear() && d.getMonth() === this.now.getMonth() && d.getDate() === this.now.getDate()) {
          today = true;
        }

        if (d.getMonth() === this.month) {
          thisMonth = true;
        }

        cells.push({
          day: d.getDate(),
          isToday: today,
          isThisMonth: thisMonth
        });
      }

      _core__WEBPACK_IMPORTED_MODULE_0__["default"].each(cells, function (day) {
        var d = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('div', 'calendar-date');

        if (!day.isThisMonth) {
          d.classList.add('is-disabled');
        }

        var button = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('button', 'date-item');

        if (_this4.isInput && day.isThisMonth) {
          button.addEventListener('click', function (event) {
            _this4.handleDayClick(event, day);
          });
        }

        if (day.isToday) {
          button.classList.add('is-today');
        }

        button.innerHTML = day.day;
        d.appendChild(button);
        calendarBody.appendChild(d);
      });
      return calendarBody;
    } //////////////////////////
    ///// EVENT HANDLERS /////
    //////////////////////////

    /**
     * Called when the input box is in focus.
     * @return {undefined}
     */

  }, {
    key: "handleInputFocus",
    value: function handleInputFocus() {
      if (this.overlay) {
        this.modal.classList.add('is-active');
      }

      this.parent.parentNode.insertBefore(this.element, this.parent.nextSibling);
    }
    /**
     * Event hander for when a day is clicked.
     * @param {Object} event The event object
     * @param {Object} day The day that was clicked
     * @return {undefined}
     */

  }, {
    key: "handleDayClick",
    value: function handleDayClick(event, day) {
      day = new Date(this.year, this.month, day.day);
      var dateString = this.formatDateString(day);
      this.parent.value = dateString;

      if (this.overlay) {
        this.modal.classList.remove('is-active');
      } else {
        this.parent.parentNode.removeChild(this.element);
      }
    }
    /**
     * Event handler for the previous month button.
     * @return {undefined}
     */

  }, {
    key: "handlePrevMonthClick",
    value: function handlePrevMonthClick() {
      this.month--;

      if (this.month < 0) {
        this.year--;
        this.month = 11;
      }

      this.render();
    }
    /**
     * Event handler for the next month button.
     * @return {undefined}
     */

  }, {
    key: "handleNextMonthClick",
    value: function handleNextMonthClick() {
      this.month++;

      if (this.month > 11) {
        this.year++;
        this.month = 0;
      }

      this.render();
    }
    /**
     * Event handler for the previous year button.
     * @return {undefined}
     */

  }, {
    key: "handlePrevYearClick",
    value: function handlePrevYearClick() {
      this.year--;
      this.render();
    }
    /**
     * Event handler for the next year button.
     * @return {undefined}
     */

  }, {
    key: "handleNextYearClick",
    value: function handleNextYearClick() {
      this.year++;
      this.render();
    }
    /**
     * Format the date based on the supplied format string.
     * @param {Object} day Date object representing the day to format
     * @returns {string} The formatted date string
     */

  }, {
    key: "formatDateString",
    value: function formatDateString(day) {
      var dateString = this.format; // May be a better/faster way of doing this?

      if (dateString.indexOf('yyyy') !== -1) {
        dateString = this.format.replace('yyyy', day.getFullYear());
      } else {
        dateString = this.format.replace('yy', day.getFullYear().toString().substr(-2));
      }

      if (dateString.indexOf('mm') !== -1) {
        var month = day.getMonth() + 1;

        if (month < 10) {
          month = '0' + month.toString();
        }

        dateString = dateString.replace('mm', month);
      } else {
        dateString = dateString.replace('m', day.getMonth() + 1);
      }

      if (dateString.indexOf('dd') !== -1) {
        var date = day.getDate();

        if (date < 10) {
          date = '0' + date.toString();
        }

        dateString = dateString.replace('dd', date);
      } else {
        dateString = dateString.replace('d', day.getDate());
      }

      return dateString;
    }
    /**
     * Clear the calendar HTML, ready for a re-render.
     * @return {undefined}
     */

  }, {
    key: "clearCalendar",
    value: function clearCalendar() {
      while (this.element.firstChild) {
        this.element.removeChild(this.element.firstChild);
      }
    }
    /**
     * Check if the passed year is a leap year.
     * @param {int} year The year to check against
     * @return {boolean} Is the year a leap year or not
     */

  }, {
    key: "isLeapYear",
    value: function isLeapYear(year) {
      // solution by Matti Virkkunen: http://stackoverflow.com/a/4881951
      return year % 4 === 0 && year % 100 !== 0 || year % 400 === 0;
    }
    /**
     * Render/build the calendar's HTML.
     * @return {undefined}
     */

  }, {
    key: "render",
    value: function render() {
      this.clearCalendar();
      this.element.appendChild(this.buildNav());
      var container = this.buildContainer();
      container.appendChild(this.buildHeader());
      container.appendChild(this.buildBody());
      this.element.appendChild(container);

      if (this.overlay) {
        this.modal.insertBefore(this.element, this.modalBackground.nextSibling);
        this.parent.appendChild(this.modal);
      } else {
        this.parent.appendChild(this.element);
      }
    }
  }]);

  return Calendar;
}(_plugin__WEBPACK_IMPORTED_MODULE_1__["default"]);

_core__WEBPACK_IMPORTED_MODULE_0__["default"].registerPlugin('calendar', Calendar);
/* harmony default export */ __webpack_exports__["default"] = (Calendar);

/***/ }),

/***/ "./node_modules/@vizuaalog/bulmajs/src/plugins/dropdown.js":
/*!*****************************************************************!*\
  !*** ./node_modules/@vizuaalog/bulmajs/src/plugins/dropdown.js ***!
  \*****************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../core */ "./node_modules/@vizuaalog/bulmajs/src/core.js");
/* harmony import */ var _plugin__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../plugin */ "./node_modules/@vizuaalog/bulmajs/src/plugin.js");
function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }

function _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return self; }

function _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }

function _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }



/**
 * @module Dropdown
 * @since  0.1.0
 * @author  Thomas Erbe <vizuaalog@gmail.com>
 */

var Dropdown =
/*#__PURE__*/
function (_Plugin) {
  _inherits(Dropdown, _Plugin);

  _createClass(Dropdown, null, [{
    key: "parse",

    /**
     * Handle parsing the DOMs data attribute API.
     * @param {HtmlElement} element The root element for this instance
     * @return {undefined}
     */
    value: function parse(element) {
      new Dropdown({
        element: element
      });
    }
    /**
     * Returns a string containing the element class this plugin supports.
     * @returns {string} The class name.
     * @throws {Error} Thrown if this method has not been replaced.
     */

  }, {
    key: "getRootClass",
    value: function getRootClass() {
      return 'dropdown';
    }
    /**
     * Plugin constructor
     * @param  {Object} options The options object for this plugin
     * @return {this} The newly created instance
     */

  }]);

  function Dropdown(options) {
    var _this;

    _classCallCheck(this, Dropdown);

    _this = _possibleConstructorReturn(this, _getPrototypeOf(Dropdown).call(this, options)); // Work out the parent if it hasn't been supplied as an option.

    if (_this.parent === null) {
      _this.parent = _this.option('element').parentNode;
    }
    /**
     * The root dropdown element.
     * @type {HTMLElement}
     */


    _this.element = _this.option('element');

    _this.element.setAttribute('data-bulma-attached', 'attached');
    /**
     * The element to trigger when clicked.
     * @type {HTMLElement}
     */


    _this.trigger = _this.element.querySelector('.dropdown-trigger');

    _this.registerEvents();

    return _this;
  }
  /**
   * Register all the events this module needs.
   * @return {undefined}
   */


  _createClass(Dropdown, [{
    key: "registerEvents",
    value: function registerEvents() {
      this.trigger.addEventListener('click', this.handleTriggerClick.bind(this));
    }
    /**
     * Handle the click event on the trigger.
     * @return {undefined}
     */

  }, {
    key: "handleTriggerClick",
    value: function handleTriggerClick() {
      if (this.element.classList.contains('is-active')) {
        this.element.classList.remove('is-active');
      } else {
        this.element.classList.add('is-active');
      }
    }
  }]);

  return Dropdown;
}(_plugin__WEBPACK_IMPORTED_MODULE_1__["default"]);

_core__WEBPACK_IMPORTED_MODULE_0__["default"].registerPlugin('dropdown', Dropdown);
/* harmony default export */ __webpack_exports__["default"] = (Dropdown);

/***/ }),

/***/ "./node_modules/@vizuaalog/bulmajs/src/plugins/file.js":
/*!*************************************************************!*\
  !*** ./node_modules/@vizuaalog/bulmajs/src/plugins/file.js ***!
  \*************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../core */ "./node_modules/@vizuaalog/bulmajs/src/core.js");
/* harmony import */ var _plugin__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../plugin */ "./node_modules/@vizuaalog/bulmajs/src/plugin.js");
function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }

function _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return self; }

function _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }

function _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }



/**
 * @module File
 * @since  0.1.0
 * @author  Thomas Erbe <vizuaalog@gmail.com>
 */

var File =
/*#__PURE__*/
function (_Plugin) {
  _inherits(File, _Plugin);

  _createClass(File, null, [{
    key: "parse",

    /**
     * Handle parsing the DOMs data attribute API.
     * @param {HTMLElement} element The root element for this plugin
     * @return {undefined}
     */
    value: function parse(element) {
      new File({
        element: element
      });
    }
    /**
     * Returns a string containing the element class this plugin supports.
     * @returns {string} The class name.
     * @throws {Error} Thrown if this method has not been replaced.
     */

  }, {
    key: "getRootClass",
    value: function getRootClass() {
      return 'file';
    }
    /**
     * Plugin constructor
     * @param  {Object} options The options object for this plugin
     * @return {this} The newly created plugin instance
     */

  }]);

  function File(options) {
    var _this;

    _classCallCheck(this, File);

    _this = _possibleConstructorReturn(this, _getPrototypeOf(File).call(this, options)); // Work out the parent if it hasn't been supplied as an option.

    if (_this.parent === null) {
      _this.parent = _this.option('element').parentNode;
    }
    /**
     * The root file element.
     * @type {HTMLElement}
     */


    _this.element = _this.option('element');

    _this.element.setAttribute('data-bulma-attached', 'attached');
    /**
     * The element to use as the trigger.
     * @type {HTMLELement}
     */


    _this.input = _this.element.querySelector('input');
    /**
     * The element to show the file name.
     * @type {HTMLElement}
     */

    _this.filename = _this.element.querySelector('.file-name');

    _this.registerEvents();

    return _this;
  }
  /**
   * Register all the events this module needs.
   * @return {undefined}
   */


  _createClass(File, [{
    key: "registerEvents",
    value: function registerEvents() {
      var _this2 = this;

      if (this.filename) {
        this.input.addEventListener('change', this.handleTriggerChange.bind(this));
      }

      this.element.addEventListener('dragover', function (e) {
        e.preventDefault();

        _this2.addHoverClass();
      });
      this.element.addEventListener('dragleave', function (e) {
        e.preventDefault();

        _this2.addHoverClass();
      });
      this.element.addEventListener('drop', function (e) {
        e.preventDefault();

        _this2.removeHoverClass();

        _this2.input.files = e.dataTransfer.files;
      });
    }
    /**
     * Handle the click event on the trigger.
     * @param  {Object} event The event object
     * @return {undefined}
     */

  }, {
    key: "handleTriggerChange",
    value: function handleTriggerChange(event) {
      if (event.target.files.length === 0) {
        this.clearFileName();
      }

      if (event.target.files.length === 1) {
        this.setFileName(event.target.files[0].name);
      }

      if (event.target.files.length > 1) {
        this.setFileName(event.target.files.length + ' files');
      }
    }
    /**
     * Clear the file name element.
     * @return {undefined}
     */

  }, {
    key: "clearFileName",
    value: function clearFileName() {
      this.filename.innerHTML = '';
    }
    /**
     * Set the text for the file name element.
     * @param {string} value The name of the file to update the label with
     * @return {undefined}
     */

  }, {
    key: "setFileName",
    value: function setFileName(value) {
      this.filename.innerHTML = value;
    }
    /**
     * Add hover class to root element.
     * @return {undefined}
     */

  }, {
    key: "addHoverClass",
    value: function addHoverClass() {
      this.element.classList.add('is-hovered');
    }
    /**
     * Remove hover class from root element.
     * @return {undefined}
     */

  }, {
    key: "removeHoverClass",
    value: function removeHoverClass() {
      this.element.classList.remove('is-hovered');
    }
  }]);

  return File;
}(_plugin__WEBPACK_IMPORTED_MODULE_1__["default"]);

_core__WEBPACK_IMPORTED_MODULE_0__["default"].registerPlugin('file', File);
/* harmony default export */ __webpack_exports__["default"] = (File);

/***/ }),

/***/ "./node_modules/@vizuaalog/bulmajs/src/plugins/message.js":
/*!****************************************************************!*\
  !*** ./node_modules/@vizuaalog/bulmajs/src/plugins/message.js ***!
  \****************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../core */ "./node_modules/@vizuaalog/bulmajs/src/core.js");
/* harmony import */ var _dismissableComponent__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../dismissableComponent */ "./node_modules/@vizuaalog/bulmajs/src/dismissableComponent.js");
function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }

function _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return self; }

function _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }

function _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }



/**
 * @module Message
 * @since  0.1.0
 * @author  Thomas Erbe <vizuaalog@gmail.com>
 * @extends DismissableComponent
 */

var Message =
/*#__PURE__*/
function (_DismissableComponent) {
  _inherits(Message, _DismissableComponent);

  _createClass(Message, null, [{
    key: "create",

    /**
     * Helper method used by the Bulma core to create a new instance.
     * @param  {Object} options THe options object for this instance
     * @return {Message} The newly created message instance
     */
    value: function create(options) {
      return new Message(options);
    }
    /**
     * Handle parsing the DOMs data attribute API.
     * @param {HTMLElement} element The root element for this plugin
     * @return {undefined}
     */

  }, {
    key: "parse",
    value: function parse(element) {
      var closeBtn = element.querySelector('.delete');
      var dismissInterval = element.getAttribute('data-dismiss-interval');
      var options = {
        body: null,
        parent: element.parentNode,
        element: element,
        closeButton: closeBtn,
        isDismissable: !!closeBtn,
        destroyOnDismiss: true
      };

      if (dismissInterval) {
        options['dismissInterval'] = parseInt(dismissInterval);
      }

      new Message(options);
    }
    /**
     * Returns a string containing the element class this plugin supports.
     * @returns {string} The class name.
     * @throws {Error} Thrown if this method has not been replaced.
     */

  }, {
    key: "getRootClass",
    value: function getRootClass() {
      return 'message';
    }
    /**
     * Plugin constructor
     * @param  {Object} options The options object for this plugin
     * @return {this} The newly created instance
     */

  }]);

  function Message(options) {
    var _this;

    _classCallCheck(this, Message);

    _this = _possibleConstructorReturn(this, _getPrototypeOf(Message).call(this, 'message', options));
    /**
     * The size of the message
     * @type {String} Possible values are small, normal, medium or large
     */

    _this.size = _this.option('size');
    /**
     * The title of the message
     * @type {String}
     */

    _this.title = _this.option('title');

    if (_this.title) {
      _this.createMessageHeader();
    } // TODO: Move this into the DismissableComponent class. Due to the required
    // changes between different components, we may need a way to trigger this
    // when the component is ready.


    if (_this.isDismissable) {
      if (!_this.option('closeButton')) {
        _this.prependCloseButton();
      }

      _this.setupCloseEvent();
    }

    if (_this.size) {
      _this.setSize();
    }

    return _this;
  }
  /**
   * Create the message header
   * @return {undefined}
   */


  _createClass(Message, [{
    key: "createMessageHeader",
    value: function createMessageHeader() {
      var header = document.createElement('div');
      header.classList.add('message-header');
      header.innerHTML = '<p>' + this.title + '</p>';
      this.title = header;
      this.element.insertBefore(this.title, this.element.firstChild);
    }
    /**
     * Set the size of the message.
     * @return {undefined}
     */

  }, {
    key: "setSize",
    value: function setSize() {
      this.element.classList.add('is-' + this.size);
    }
    /**
     * Insert the body text into the component.
     * @return {undefined}
     */

  }, {
    key: "insertBody",
    value: function insertBody() {
      var body = document.createElement('div');
      body.classList.add('message-body');
      body.innerHTML = this.body;
      this.element.appendChild(body);
    }
    /**
     * Insert the close button before our content.
     * @return {undefined}
     */

  }, {
    key: "prependCloseButton",
    value: function prependCloseButton() {
      this.title.appendChild(this.closeButton);
    }
  }]);

  return Message;
}(_dismissableComponent__WEBPACK_IMPORTED_MODULE_1__["default"]);

_core__WEBPACK_IMPORTED_MODULE_0__["default"].registerPlugin('message', Message);
/* harmony default export */ __webpack_exports__["default"] = (Message);

/***/ }),

/***/ "./node_modules/@vizuaalog/bulmajs/src/plugins/modal.js":
/*!**************************************************************!*\
  !*** ./node_modules/@vizuaalog/bulmajs/src/plugins/modal.js ***!
  \**************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../core */ "./node_modules/@vizuaalog/bulmajs/src/core.js");
/* harmony import */ var _plugin__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../plugin */ "./node_modules/@vizuaalog/bulmajs/src/plugin.js");
function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }

function _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return self; }

function _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }

function _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }



/**
 * @module Modal
 * @since  0.1.0
 * @author  Thomas Erbe <vizuaalog@gmail.com>
 */

var Modal =
/*#__PURE__*/
function (_Plugin) {
  _inherits(Modal, _Plugin);

  _createClass(Modal, null, [{
    key: "create",

    /**
     * Helper method used by the Bulma core to create a new instance.
     * @param  {Object} options THe options object for the new instance
     * @return {Modal} The newly created instance
     */
    value: function create(options) {
      return new Modal(options);
    }
    /**
     * Get the root class this plugin is responsible for.
     * This will tell the core to match this plugin to an element with a .modal class.
     * @returns {string} The class this plugin is responsible for.
     */

  }, {
    key: "getRootClass",
    value: function getRootClass() {
      return 'modal';
    }
    /**
     * Returns an object containing the default options for this plugin.
     * @returns {object} The default options object.
     */

  }, {
    key: "defaultOptions",
    value: function defaultOptions() {
      return {
        style: 'card',
        closable: true
      };
    }
    /**
     * Plugin constructor
     * @param  {Object} options The options object for this plugin
     * @return {this} The newly created plugin instance
     */

  }]);

  function Modal(options) {
    var _this;

    _classCallCheck(this, Modal);

    _this = _possibleConstructorReturn(this, _getPrototypeOf(Modal).call(this, options));
    /** @param {string} */

    _this.style = _this.option('style');
    /** @param {HTMLElement} */

    _this.element = _this.option('element');

    if (!_this.element) {
      _this.element = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('div', 'modal');
    }
    /** @param {HTMLElement} */


    _this.parent = _this.option('parent');

    if (!_this.parent) {
      if (!_this.element.parentNode) {
        _this.parent = document.body;

        _this.parent.appendChild(_this.element);
      } else {
        _this.parent = _this.element.parentNode;
      }
    } else {
      _this.parent.appendChild(_this.element);
    }
    /** @param {HTMLElement} */


    _this.background = _core__WEBPACK_IMPORTED_MODULE_0__["default"].findOrCreateElement('.modal-background', _this.element);
    /** @param {HTMLElement} */

    _this.content = _this.style === 'card' ? _core__WEBPACK_IMPORTED_MODULE_0__["default"].findOrCreateElement('.modal-card', _this.element) : _core__WEBPACK_IMPORTED_MODULE_0__["default"].findOrCreateElement('.modal-content', _this.element);
    /** @param {boolean} */

    _this.closable = _this.option('closable');
    /** @param {string|null} */

    _this.body = _this.option('body');
    /** @param {string|null} */

    _this.title = _this.option('title');

    if (_this.style === 'card') {
      _this.createCardStructure();
    } else {
      if (!_this.content.innerHTML) {
        _this.content.innerHTML = _this.body;
      }
    }

    if (_this.closable) {
      /** @param {HTMLElement} */
      _this.closeButton = _this.style === 'card' ? _core__WEBPACK_IMPORTED_MODULE_0__["default"].findOrCreateElement('.delete', _this.header, 'button') : _core__WEBPACK_IMPORTED_MODULE_0__["default"].findOrCreateElement('.modal-close', _this.element, 'button');
    }
    /** @param {function} */


    _this.onOpen = _this.option('onOpen');
    /** @param {function} */

    _this.onClose = _this.option('onClose');

    if (_this.style === 'card') {
      _this.createButtons();
    }

    _this.setupEvents();

    return _this;
  }
  /**
   * Create the card style structure
   * @returns {void}
   */


  _createClass(Modal, [{
    key: "createCardStructure",
    value: function createCardStructure() {
      /** @param {HTMLElement} */
      this.header = _core__WEBPACK_IMPORTED_MODULE_0__["default"].findOrCreateElement('.modal-card-head', this.content, 'header');
      /** @param {HTMLElement} */

      this.headerTitle = _core__WEBPACK_IMPORTED_MODULE_0__["default"].findOrCreateElement('.modal-card-title', this.header, 'p');

      if (!this.headerTitle.innerHTML) {
        this.headerTitle.innerHTML = this.title;
      }
      /** @param {HTMLElement} */


      this.cardBody = _core__WEBPACK_IMPORTED_MODULE_0__["default"].findOrCreateElement('.modal-card-body', this.content, 'section');

      if (!this.cardBody.innerHTML) {
        this.cardBody.innerHTML = this.body;
      }
      /** @param {HTMLElement} */


      this.footer = _core__WEBPACK_IMPORTED_MODULE_0__["default"].findOrCreateElement('.modal-card-foot', this.content, 'footer');
    }
    /**
     * Setup the events used by this modal.
     * @returns {void}
     */

  }, {
    key: "setupEvents",
    value: function setupEvents() {
      var _this2 = this;

      if (this.closable) {
        this.closeButton.addEventListener('click', this.close.bind(this));

        this.keyupListenerBound = function (evt) {
          return _this2.keyupListener(evt);
        };

        document.addEventListener('keyup', this.keyupListenerBound);
        this.background.addEventListener('click', this.close.bind(this));
      }
    }
    /**
     * Go through the provided buttons option and create the buttons.
     * @returns {void}
     */

  }, {
    key: "createButtons",
    value: function createButtons() {
      var buttonsConfig = this.option('buttons', []);
      var modal = this;
      _core__WEBPACK_IMPORTED_MODULE_0__["default"].each(buttonsConfig, function (buttonConfig) {
        var button = _core__WEBPACK_IMPORTED_MODULE_0__["default"].createElement('button', buttonConfig.classes);
        button.innerHTML = buttonConfig.label;
        button.addEventListener('click', function (event) {
          buttonConfig.onClick(event);
        });
        modal.footer.appendChild(button);
      });
    }
    /**
     * Handle the esc key being pressed.
     * @param {MouseEvent} event 
     */

  }, {
    key: "keyupListener",
    value: function keyupListener(event) {
      if (!this.element.classList.contains('is-active')) {
        return;
      }

      var key = event.key || event.keyCode;

      if (key === 'Escape' || key === 'Esc' || key === 27) {
        this.close();
      }
    }
    /**
     * Open the modal
     * @returns {void}
     */

  }, {
    key: "open",
    value: function open() {
      this.element.classList.add('is-active');
      document.documentElement.classList.add('is-clipped');

      if (this.onOpen) {
        this.onOpen(this);
      }
    }
    /**
     * Close the modal
     * @returns {void} 
     */

  }, {
    key: "close",
    value: function close() {
      this.element.classList.remove('is-active');
      document.documentElement.classList.remove('is-clipped');

      if (this.onClose) {
        this.onClose(this);
      }
    }
    /**
     * Destroy this modal, unregistering element references and removing the modal.
     * @returns {void}
     */

  }, {
    key: "destroy",
    value: function destroy() {
      this.element.remove();
      this.parent = null;
      this.element = null;
      this.background = null;
      this.content = null;

      if (this.style === 'card') {
        this.header = null;
        this.headerTitle = null;
        this.cardBody = null;
        this.footer = null;
      }

      if (this.closable) {
        this.closeButton = null;
        document.removeEventListener('keyup', this.keyupListenerBound);
      }

      this.options = [];
    }
  }]);

  return Modal;
}(_plugin__WEBPACK_IMPORTED_MODULE_1__["default"]);

_core__WEBPACK_IMPORTED_MODULE_0__["default"].registerPlugin('modal', Modal);
/* harmony default export */ __webpack_exports__["default"] = (Modal);

/***/ }),

/***/ "./node_modules/@vizuaalog/bulmajs/src/plugins/navbar.js":
/*!***************************************************************!*\
  !*** ./node_modules/@vizuaalog/bulmajs/src/plugins/navbar.js ***!
  \***************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../core */ "./node_modules/@vizuaalog/bulmajs/src/core.js");
/* harmony import */ var _plugin__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../plugin */ "./node_modules/@vizuaalog/bulmajs/src/plugin.js");
function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }

function _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return self; }

function _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }

function _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }



/**
 * @module Navbar
 * @since  0.1.0
 * @author  Thomas Erbe <vizuaalog@gmail.com>
 */

var Navbar =
/*#__PURE__*/
function (_Plugin) {
  _inherits(Navbar, _Plugin);

  _createClass(Navbar, null, [{
    key: "getRootClass",

    /**
     * Returns a string containing the element class this plugin supports.
     * @returns {string} The class name.
     * @throws {Error} Thrown if this method has not been replaced.
     */
    value: function getRootClass() {
      return 'navbar';
    }
    /**
     * Handle parsing the DOMs data attribute API.
     * @param {HTMLElement} element The root element for this instance
     * @return {undefined}
     */

  }, {
    key: "parse",
    value: function parse(element) {
      new Navbar({
        element: element,
        sticky: element.hasAttribute('data-sticky') ? true : false,
        stickyOffset: element.hasAttribute('data-sticky-offset') ? element.getAttribute('data-sticky-offset') : 0,
        hideOnScroll: element.hasAttribute('data-hide-on-scroll') ? true : false,
        tolerance: element.hasAttribute('data-tolerance') ? element.getAttribute('data-tolerance') : 0,
        hideOffset: element.hasAttribute('data-hide-offset') ? element.getAttribute('data-hide-offset') : 0,
        shadow: element.hasAttribute('data-sticky-shadow') ? true : false
      });
    }
    /**
     * Returns an object containing the default options for this plugin.
     * @returns {object} The default options object.
     */

  }, {
    key: "defaultOptions",
    value: function defaultOptions() {
      return {
        sticky: false,
        stickyOffset: 0,
        hideOnScroll: false,
        tolerance: 0,
        hideOffset: 0,
        shadow: false
      };
    }
    /**
     * Plugin constructor
     * @param  {Object} options The options object for this plugin
     * @return {this} The newly created plugin instance
     */

  }]);

  function Navbar(options) {
    var _this;

    _classCallCheck(this, Navbar);

    _this = _possibleConstructorReturn(this, _getPrototypeOf(Navbar).call(this, options)); // Work out the parent if it hasn't been supplied as an option.

    if (_this.parent === null) {
      _this.parent = _this.option('element').parentNode;
    }
    /**
     * The root navbar element.
     * @type {HTMLElement}
     */


    _this.element = _this.option('element');
    /**
     * The element used for the trigger.
     * @type {HTMLElement}
     */

    _this.trigger = _this.element.querySelector('.navbar-burger'),
    /**
     * The target element.
     * @type {HTMLELement}
     */
    _this.target = _this.element.querySelector('.navbar-menu');
    /**
     * Should this navbar stick to the top of the page?
     * @type {boolean}
     */

    _this.sticky = !!_this.option('sticky');
    /**
     * The offset in pixels before the navbar will stick to the top of the page
     * @type {number}
     */

    _this.stickyOffset = parseInt(_this.option('stickyOffset'));
    /**
     * Should the navbar hide when scrolling? Note: this just applies a 'is-hidden-scroll' class.
     * @type {boolean}
     */

    _this.hideOnScroll = !!_this.option('hideOnScroll');
    /**
     * The amount of tolerance required before checking the navbar should hide/show
     * @type {number}
     */

    _this.tolerance = parseInt(_this.option('tolerance'));
    /**
     * Add a shadow when the navbar is sticky?
     * @type {boolean}
     */

    _this.shadow = !!_this.option('shadow');
    /**
     * The offset in pixels before the navbar will be hidden, defaults to the height of the navbar
     * @type {number}
     */

    _this.hideOffset = parseInt(_this.option('hideOffset', Math.max(_this.element.scrollHeight, _this.stickyOffset)));
    /**
     * The last scroll Y known, this is used to calculate scroll direction
     * @type {number}
     */

    _this.lastScrollY = 0;

    _this.registerEvents();

    return _this;
  }
  /**
   * Register all the events this module needs.
   * @return {undefined}
   */


  _createClass(Navbar, [{
    key: "registerEvents",
    value: function registerEvents() {
      this.trigger.addEventListener('click', this.handleTriggerClick.bind(this));

      if (this.sticky) {
        window.addEventListener('scroll', this.handleScroll.bind(this));
      }
    }
    /**
     * Handle the click event on the trigger.
     * @return {undefined}
     */

  }, {
    key: "handleTriggerClick",
    value: function handleTriggerClick() {
      if (this.target.classList.contains('is-active')) {
        this.target.classList.remove('is-active');
        this.trigger.classList.remove('is-active');
      } else {
        this.target.classList.add('is-active');
        this.trigger.classList.add('is-active');
      }
    }
    /**
     * Handle the scroll event
     * @return {undefined}
     */

  }, {
    key: "handleScroll",
    value: function handleScroll() {
      this.toggleSticky(window.pageYOffset);
    }
    /**
     * Toggle the navbar's sticky state
     * @param {number} scrollY The amount of pixels that has been scrolled
     * @return {undefined}
     */

  }, {
    key: "toggleSticky",
    value: function toggleSticky(scrollY) {
      if (scrollY > this.stickyOffset) {
        this.element.classList.add('is-fixed-top');
        document.body.classList.add('has-navbar-fixed-top');

        if (this.shadow) {
          this.element.classList.add('has-shadow');
        }
      } else {
        this.element.classList.remove('is-fixed-top');
        document.body.classList.remove('has-navbar-fixed-top');

        if (this.shadow) {
          this.element.classList.remove('has-shadow');
        }
      }

      if (this.hideOnScroll) {
        var scrollDirection = this.calculateScrollDirection(scrollY, this.lastScrollY);
        var triggeredTolerance = this.difference(scrollY, this.lastScrollY) >= this.tolerance;

        if (scrollDirection === 'down') {
          // only hide the navbar at the top if we reach a certain offset so the hiding is more smooth
          var isBeyondTopOffset = scrollY > this.hideOffset;

          if (triggeredTolerance && isBeyondTopOffset) {
            this.element.classList.add('is-hidden-scroll');
          }
        } else {
          // if scrolling up to the very top where the navbar would be by default always show it
          var isAtVeryTop = scrollY < this.hideOffset;

          if (triggeredTolerance || isAtVeryTop) {
            this.element.classList.remove('is-hidden-scroll');
          }
        }

        this.lastScrollY = scrollY;
      }
    }
  }, {
    key: "difference",
    value: function difference(a, b) {
      if (a > b) {
        return a - b;
      } else {
        return b - a;
      }
    }
  }, {
    key: "calculateScrollDirection",
    value: function calculateScrollDirection(currentY, lastY) {
      return currentY >= lastY ? 'down' : 'up';
    }
  }]);

  return Navbar;
}(_plugin__WEBPACK_IMPORTED_MODULE_1__["default"]);

_core__WEBPACK_IMPORTED_MODULE_0__["default"].registerPlugin('navbar', Navbar);
/* harmony default export */ __webpack_exports__["default"] = (Navbar);

/***/ }),

/***/ "./node_modules/@vizuaalog/bulmajs/src/plugins/notification.js":
/*!*********************************************************************!*\
  !*** ./node_modules/@vizuaalog/bulmajs/src/plugins/notification.js ***!
  \*********************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../core */ "./node_modules/@vizuaalog/bulmajs/src/core.js");
/* harmony import */ var _dismissableComponent__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../dismissableComponent */ "./node_modules/@vizuaalog/bulmajs/src/dismissableComponent.js");
function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }

function _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return self; }

function _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }

function _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }



/**
 * @module Notification
 * @since  0.1.0
 * @author  Thomas Erbe <vizuaalog@gmail.com>
 * @extends DismissableComponent
 */

var Notification =
/*#__PURE__*/
function (_DismissableComponent) {
  _inherits(Notification, _DismissableComponent);

  _createClass(Notification, null, [{
    key: "create",

    /**
     * Helper method used by the Bulma core to create a new instance.
     * @param  {Object} options The options object for this instance
     * @return {Notification} The newly created instance
     */
    value: function create(options) {
      return new Notification(options);
    }
    /**
     * Handle parsing the DOMs data attribute API.
     * @param {HTMLElement} element The root element for this instance
     * @return {undefined}
     */

  }, {
    key: "parse",
    value: function parse(element) {
      var closeBtn = element.querySelector('.delete');
      var dismissInterval = element.getAttribute('data-dismiss-interval');
      var options = {
        body: null,
        parent: element.parentNode,
        element: element,
        closeButton: closeBtn,
        isDismissable: !!closeBtn,
        destroyOnDismiss: true
      };

      if (dismissInterval) {
        options['dismissInterval'] = parseInt(dismissInterval);
      }

      new Notification(options);
    }
    /**
     * Returns a string containing the element class this plugin supports.
     * @returns {string} The class name.
     * @throws {Error} Thrown if this method has not been replaced.
     */

  }, {
    key: "getRootClass",
    value: function getRootClass() {
      return 'notification';
    }
    /**
     * Plugin constructor
     * @param  {Object} options The options object for this plugin
     * @return {this} The newly created instance
     */

  }]);

  function Notification(options) {
    var _this;

    _classCallCheck(this, Notification);

    _this = _possibleConstructorReturn(this, _getPrototypeOf(Notification).call(this, 'notification', options)); // TODO: Move this into the DismissableComponent class. Due to the required
    // changes between different components, we may need a way to trigger this
    // when the component is ready.

    if (_this.isDismissable) {
      if (!options.hasOwnProperty('closeButton')) {
        _this.prependCloseButton();
      }

      _this.setupCloseEvent();
    }

    return _this;
  }

  return Notification;
}(_dismissableComponent__WEBPACK_IMPORTED_MODULE_1__["default"]);

_core__WEBPACK_IMPORTED_MODULE_0__["default"].registerPlugin('notification', Notification);
/* harmony default export */ __webpack_exports__["default"] = (Notification);

/***/ }),

/***/ "./node_modules/@vizuaalog/bulmajs/src/plugins/tabs.js":
/*!*************************************************************!*\
  !*** ./node_modules/@vizuaalog/bulmajs/src/plugins/tabs.js ***!
  \*************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../core */ "./node_modules/@vizuaalog/bulmajs/src/core.js");
/* harmony import */ var _plugin__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../plugin */ "./node_modules/@vizuaalog/bulmajs/src/plugin.js");
function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }

function _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return self; }

function _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }

function _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }



/**
 * @module Tabs
 * @since  0.4.0
 * @author  Thomas Erbe <vizuaalog@gmail.com>
 */

var Tabs =
/*#__PURE__*/
function (_Plugin) {
  _inherits(Tabs, _Plugin);

  _createClass(Tabs, null, [{
    key: "create",

    /**
     * Helper method used by the Bulma core to create a new instance.
     * @param  {Object} options The options object for this instance
     * @returns {Tabs} The newly created instance
     */
    value: function create(options) {
      return new Tabs(options);
    }
    /**
     * Handle parsing the DOMs data attribute API.
     * @param {HTMLElement} element The root element for this instance
     * @returns {undefined}
     */

  }, {
    key: "parse",
    value: function parse(element) {
      var hover = element.hasAttribute('data-hover') ? true : false;
      var options = {
        element: element,
        hover: hover
      };
      new Tabs(options);
    }
    /**
     * The root class used for initialisation
     * @returns {string} The class this plugin is responsible for
     */

  }, {
    key: "getRootClass",
    value: function getRootClass() {
      return 'tabs-wrapper';
    }
    /**
     * Returns an object containing the default options for this plugin.
     * @returns {object} The default options object.
     */

  }, {
    key: "defaultOptions",
    value: function defaultOptions() {
      return {
        hover: false
      };
    }
    /**
     * Plugin constructor
     * @param  {Object} options The options object for this plugin
     * @return {this} The newly created instance
     */

  }]);

  function Tabs(options) {
    var _this;

    _classCallCheck(this, Tabs);

    _this = _possibleConstructorReturn(this, _getPrototypeOf(Tabs).call(this, options));
    /**
     * The root tab element
     * @param {HTMLElement}
     */

    _this.element = _this.option('element');

    _this.element.setAttribute('data-bulma-attached', 'attached');
    /**
     * Whether the tabs should be changed when the nav item is hovered over
     * @param {boolean}
     */


    _this.hover = _this.option('hover');
    /**
     * The tab nav container
     * @param {HTMLElement}
     */

    _this.nav = _this.findNav();
    /**
     * The tab's nav items
     * @param {HTMLElement[]}
     */

    _this.navItems = _this.findNavItems();
    /**
     * The tab content container
     * @param {HTMLElement}
     */

    _this.content = _this.findContent();
    /**
     * The tab's content items
     * @param {HTMLElement[]}
     */

    _this.contentItems = _this.findContentItems();

    _this.setupNavEvents();

    return _this;
  }
  /**
   * Find the tab navigation container.
   * @returns {HTMLElement} The navigation container
   */


  _createClass(Tabs, [{
    key: "findNav",
    value: function findNav() {
      return this.element.querySelector('.tabs');
    }
    /**
     * Find each individual tab item
     * @returns {HTMLElement[]} An array of the found items
     */

  }, {
    key: "findNavItems",
    value: function findNavItems() {
      return this.nav.querySelectorAll('li');
    }
    /**
     * Find the tab content container.
     * @returns {HTMLElement} The content container
     */

  }, {
    key: "findContent",
    value: function findContent() {
      return this.element.querySelector('.tabs-content');
    }
    /**
     * Find each individual content item
     * @returns {HTMLElement[]} An array of the found items
     */

  }, {
    key: "findContentItems",
    value: function findContentItems() {
      // We have to use the root here as the querySelectorAll API doesn't
      // support using '>' as the first character. So we have to have a
      // class to start with.
      return this.element.querySelectorAll('.tabs-content > ul > li');
    }
    /**
     * Setup the events to handle tab changing
     * @returns {void}
     */

  }, {
    key: "setupNavEvents",
    value: function setupNavEvents() {
      var _this2 = this;

      _core__WEBPACK_IMPORTED_MODULE_0__["default"].each(this.navItems, function (navItem, index) {
        navItem.addEventListener('click', function () {
          _this2.handleNavClick(navItem, index);
        });

        if (_this2.hover) {
          navItem.addEventListener('mouseover', function () {
            _this2.handleNavClick(navItem, index);
          });
        }
      });
    }
    /**
     * Handle the changing of the visible tab
     * @param {HTMLelement} navItem The nav item we are changing to
     * @param {number} index The internal index of the nav item we're changing to
     * @returns {void}
     */

  }, {
    key: "handleNavClick",
    value: function handleNavClick(navItem, index) {
      _core__WEBPACK_IMPORTED_MODULE_0__["default"].each(this.navItems, function (navItem) {
        navItem.classList.remove('is-active');
      });
      _core__WEBPACK_IMPORTED_MODULE_0__["default"].each(this.contentItems, function (contentItem) {
        contentItem.classList.remove('is-active');
      });
      navItem.classList.add('is-active');
      this.contentItems[index].classList.add('is-active');
    }
  }]);

  return Tabs;
}(_plugin__WEBPACK_IMPORTED_MODULE_1__["default"]);

_core__WEBPACK_IMPORTED_MODULE_0__["default"].registerPlugin('tabs', Tabs);
/* harmony default export */ __webpack_exports__["default"] = (Tabs);

/***/ })

/******/ });
//# sourceMappingURL=journal_articles-880017664246834160ad.js.map