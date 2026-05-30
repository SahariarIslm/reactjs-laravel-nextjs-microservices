import React from 'react';

import Dashboard from './secure/Dashboard';
import Users from './secure/Users';
import Login from './public/Login';
import Register from './public/Register';
import { BrowserRouter, Routes, Route } from 'react-router-dom';

function App() {
  return (
    <div className='App'> 
      <BrowserRouter>
        <Routes>
          <Route path={'/'} Component={Dashboard} />
          <Route path={'/users'} Component={Users} />
          <Route path={'/login'} Component={Login} />
          <Route path={'/register'} Component={Register} />
        </Routes>
      </BrowserRouter>   
    </div>
  );
}

export default App;
