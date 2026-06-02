import React, {Component} from 'react'
import { Link, Navigate } from 'react-router-dom';
import { User } from '../../classes/user';
import { connect } from 'react-redux';
import axios from 'axios';

class Nav extends Component<{user: User}> {
  state = {
    redirect: false
  }
  handleClick = async () => {
    await axios.post('logout', {});
    
    // Clear the token
    delete axios.defaults.headers.common['Authorization'];
    
    this.setState({ redirect: true })
  }
  render() {
    if(this.state.redirect){
        return <Navigate to="/login" />;
    };
    return (
      <header className="navbar sticky-top bg-dark flex-md-nowrap p-0 shadow" data-bs-theme="dark">
        <a className="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6 text-white" href="#">Company name</a>
        
        <ul className="navbar-nav flex-row">
            <Link to={'/profile'} className="nav-link px-3 text-white">{this.props.user.name}</Link>
            <button className="nav-link px-3 text-white" type="button" onClick={this.handleClick}>
              Sign Out
            </button>
        </ul>
        
        <div id="navbarSearch" className="navbar-search w-100 collapse">
          <input className="form-control w-100 rounded-0 border-0" type="text" placeholder="Search" aria-label="Search" />
        </div>
      </header>
    )
  }
}

// @ts-ignore
export default connect(state => ({user: state.user}))(Nav)