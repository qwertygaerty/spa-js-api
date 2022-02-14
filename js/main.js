import {f} from "./helper.js";
import LoginForm from "./components/LoginForm.js";
import Router from "./libs/router.js";
import Users from "./components/Users.js";
import User from "./components/User.js";

const dEvent = (event, detail) => {
    document.dispatchEvent(new CustomEvent(
        event, {
            detail: detail
        }
    ))
}

class App {
    constructor() {
        this.defineElements();
    }

    defineElements() {
        customElements.define("shop-admin-user", User);
    }

}

const routes = [
    {path: "/login", component: LoginForm, name: 'Вход'},
    {path: "/users", component: Users, name: 'Работники'},
]



const router = new Router(
    {routes})

new App();

export {f, dEvent};