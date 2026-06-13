import React from 'react';
import Main from './pages/Main';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import Login from './public/Login';
import Register from './public/Register';

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>
          <Route path='/' Component={Main} />
          <Route path='/login' Component={Login} />
          <Route path='/register' Component={Register} />
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
