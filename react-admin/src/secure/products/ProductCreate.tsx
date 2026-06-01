import React, { Component, SyntheticEvent } from 'react'
import Wrapper from '../Wrapper'
import axios from 'axios'
import { Navigate } from 'react-router-dom';
import ImageUpload from '../components/ImageUpload';

class ProductCreate extends Component {
    state = {
        image: '',
        redirect: false
    }
    title = '';
    description = '';
    image = '';
    price = 0;

    submit = async (e: SyntheticEvent) => {
        e.preventDefault();
        
        await axios.post('products', {
            title: this.title,
            description: this.description,
            image: this.image,
            price: this.price
        });
        this.setState({
            redirect: true
        })
    };

    imageChanged = async (image: string) => {
        this.image = image;
        this.setState({
            image: this.image
        })
    }

    render() {
        if (this.state.redirect) {
            return <Navigate to="/products" />;
        }
        return (
            <Wrapper>
                <form className="form-signin" onSubmit={this.submit}>
                    <div className='form-group row'>
                        <label htmlFor="title" className="col-sm-2 col-form-label">Title</label>
                        <div className="col-sm-10">
                            <input type="text" id="title" className="form-control" name="title"
                                onChange={e => this.title = e.target.value}
                            />
                        </div>
                    </div>
                    <div className='form-group row'>
                        <label htmlFor="description" className="col-sm-2 col-form-label">Description</label>
                        <div className="col-sm-10">
                            <textarea id="description" className="form-control" name="description" 
                                onChange={e => this.description = e.target.value}
                            />
                        </div>
                    </div>
                    <div className='form-group row'>
                        <label htmlFor="image" className="col-sm-2 col-form-label">Image</label>
                        <ImageUpload value={this.image = this.state.image} imageChanged={this.imageChanged} />
                    </div>
                    <div className='form-group row'>
                        <label htmlFor="price" className="col-sm-2 col-form-label">Price</label>
                        <div className="col-sm-10">
                            <input type="number" id="price" className="form-control" name="price" 
                                onChange={e => this.price = parseFloat(e.target.value)}
                            />
                        </div>
                    </div>
                    <button className="btn btn-outline-secondary" type="submit">save</button>
                </form>
            </Wrapper>
        )
    }
}

export default ProductCreate;