// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery";
import "popper.js";
import "bootstrap";
import "select2"  // yarnを実行しnode_moduleにインストールされたファイル
import "jscroll"  // yarnを実行しnode_moduleにインストールされたファイル

import "./kyotobread.js"   // topのタブメニュー
import "./shopsearch.js"   // _post-form.html.erbで使用
import "./jquery.jscroll.min.js"  // 無限スクロール


import "../stylesheets/application"

import '@fortawesome/fontawesome-free/js/all'

Rails.start()
Turbolinks.start()
ActiveStorage.start()