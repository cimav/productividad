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
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /Users/ion/productividad/app/javascript/packs/journal_articles.js: Unexpected token, expected \",\" (2:35)\n\n  1 | $(document).on(\"turbolinks:load\", function() {\n> 2 |   console.log(Bulma.parseDocument();)\n    |                                    ^\n  3 | });\n  4 | \n  5 | $(document).on('change', '#journal_article_status', function() {\n    at Parser.raise (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:6325:17)\n    at Parser.unexpected (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:7642:16)\n    at Parser.expect (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:7628:28)\n    at Parser.parseCallExpressionArguments (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:8606:14)\n    at Parser.parseSubscript (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:8514:29)\n    at Parser.parseSubscripts (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:8433:19)\n    at Parser.parseExprSubscripts (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:8422:17)\n    at Parser.parseMaybeUnary (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:8392:21)\n    at Parser.parseExprOps (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:8267:23)\n    at Parser.parseMaybeConditional (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:8240:23)\n    at Parser.parseMaybeAssign (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:8187:21)\n    at Parser.parseExpression (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:8135:23)\n    at Parser.parseStatementContent (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:9958:23)\n    at Parser.parseStatement (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:9829:17)\n    at Parser.parseBlockOrModuleBlockBody (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:10405:25)\n    at Parser.parseBlockBody (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:10392:10)\n    at Parser.parseBlock (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:10376:10)\n    at Parser.parseFunctionBody (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:9424:24)\n    at Parser.parseFunctionBodyAndFinish (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:9394:10)\n    at withTopicForbiddingContext (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:10535:12)\n    at Parser.withTopicForbiddingContext (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:9702:14)\n    at Parser.parseFunction (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:10534:10)\n    at Parser.parseFunctionExpression (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:8877:17)\n    at Parser.parseExprAtom (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:8790:21)\n    at Parser.parseExprSubscripts (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:8412:23)\n    at Parser.parseMaybeUnary (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:8392:21)\n    at Parser.parseExprOps (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:8267:23)\n    at Parser.parseMaybeConditional (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:8240:23)\n    at Parser.parseMaybeAssign (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:8187:21)\n    at Parser.parseExprListItem (/Users/ion/productividad/node_modules/@babel/parser/lib/index.js:9491:18)");

/***/ })

/******/ });
//# sourceMappingURL=journal_articles-e01a71498e867ac3d279.js.map