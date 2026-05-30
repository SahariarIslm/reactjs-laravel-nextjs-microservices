import React, {Component} from 'react'
class Login extends Component{
    componentDidMount() {
        // Inject the style tag dynamically when Login loads
        const link = document.createElement('link');
        link.rel = 'stylesheet';
        link.href = '/public.css'; 
        link.id = 'public-bootstrap-css';
        document.head.appendChild(link);
    }

    componentWillUnmount() {
        // Remove it when the user leaves the page to prevent styling leaks
        const link = document.getElementById('public-bootstrap-css');
        if (link) {
        link.remove();
        }
    }
    render(){
        return (
            <form className="form-signin">
                <h1 className="h3 mb-3 font-weight-normal">Please sign in</h1>
                <label htmlFor="inputEmail" className="sr-only">Email address</label>
                <input type="email" id="inputEmail" className="form-control" placeholder="Email address" required autoFocus />
                <label htmlFor="inputPassword" className="sr-only">Password</label>
                <input type="password" id="inputPassword" className="form-control" placeholder="Password" required />
                <button className="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form>
        )
    }
}

export default Login