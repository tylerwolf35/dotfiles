// ==UserScript==
// @name         hide ecosia chrome button
// @include      https://www.ecosia.org/*
// @run-at       document-idle
// ==/UserScript==

document.getElementsByClassName("main-header__install-cta")[0].remove()
