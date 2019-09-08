require('./bootstrap.js');

window.Vue = require('vue');

/**
 * The following block of code will automatically register the application
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/Example.vue -> <example></example>
 */
const files = require.context('./', true, /\.vue$/i)
files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

/**
 * If you want to register the Vue components manually, you can do so
 * by using something like the following:
 */
// Vue.component('example', require('./components/Example.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */
const app = new Vue({
    el: '#app',
});
