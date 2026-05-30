import React, { Component, ReactNode } from 'react'
import Nav from './components/Nav';
import Menu from './components/Menu';
import axios from 'axios';
import { Navigate, redirect } from 'react-router-dom';

interface WrapperProps {
  children?: ReactNode;
}

export default class Wrapper extends Component<WrapperProps> {

  state = {
    redirect: false
  }
  componentDidMount = async () => {
    try{
      const response = await axios.get('user');
      console.log(response);
    }catch(e){
      this.setState({
        redirect:true
      })
    }
    
  }

  render() {
    if(this.state.redirect){
        return <Navigate to="/login" />;
    };
    return (
        <>
            <Nav /> 
            <div className="container-fluid"> 
                <div className="row"> 
                <Menu /> 
                <main className="col-md-9 ms-sm-auto col-lg-10 px-md-4"> 
                    {this.props.children}
                </main> 
                </div> 
            </div>
        </>
    )
  }
}
