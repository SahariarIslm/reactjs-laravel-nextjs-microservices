import React from 'react';

import Dashboard from './secure/dashboard/Dashboard';
import Users from './secure/users/Users';
import Login from './public/Login';
import Register from './public/Register';
import UserCreate from './secure/users/UserCreate';
import { BrowserRouter, Routes, Route } from 'react-router-dom';

function App() {
  return (
    <div className='App'> 
      <BrowserRouter>
        <Routes>
          <Route path={'/'} Component={Dashboard} />
          <Route path={'/login'} Component={Login} />
          <Route path={'/register'} Component={Register} />
          <Route path={'/users'} Component={Users} />
          <Route path={'/users/create'} Component={UserCreate} />
        </Routes>
      </BrowserRouter>   
    </div>
  );
}

export default App;
