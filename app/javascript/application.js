// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "./custom";
// Rails UJSを有効化
import Rails from "@rails/ujs";
Rails.start();
import "@hotwired/turbo-rails"; // Turboフレームを有効化
import "controllers";           // Stimulusコントローラーを読み込み

