import React, { Component, SyntheticEvent } from 'react'
import Wrapper from '../Wrapper'
import axios from 'axios'
import { Navigate } from 'react-router-dom';
import ImageUpload from '../components/ImageUpload';
import { Product } from '../../classes/product';

class ProductEdit extends Component<{ match: any }> {
    state = {
        title: '',
        description: '',
        image: '',
        price: 0,
        redirect: false
    }
    id = 0;
    title = '';
    description = '';
    image = '';
    price = 0;

    componentDidMount = async () => {
        // get the id from the url
        this.id = this.props.match.params.id;
        // fetch the product data from the api
        const response = await axios.get(`products/${this.id}`);
        const product:Product = response.data.data;
        this.title = product.title;
        this.description = product.description;
        this.image = product.image;
        this.price = product.price;
        this.setState({
            title: this.title,
            description: this.description,
            image: this.image,
            price: this.price
        })
    }

    submit = async (e: SyntheticEvent) => {
        e.preventDefault();
        
        await axios.put(`products/${this.id}`, {
            title: this.state.title,
            description: this.state.description,
            image: this.state.image,
            price: this.state.price
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
                                defaultValue={this.title = this.state.title}
                                onChange={e => this.setState({
                                    title: e.target.value
                                })}
                            />
                        </div>
                    </div>
                    <div className='form-group row'>
                        <label htmlFor="description" className="col-sm-2 col-form-label">Description</label>
                        <div className="col-sm-10">
                            <textarea id="description" className="form-control" name="description" 
                                defaultValue={this.description = this.state.description}
                                onChange={e => this.setState({
                                    description: e.target.value
                                })}
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
                                value={this.price = this.state.price}
                                onChange={e => {
                                    this.price = parseFloat(e.target.value)
                                    this.setState({
                                        price: this.price
                                    })
                                }}
                            />
                        </div>
                    </div>
                    <button className="btn btn-outline-secondary" type="submit">save</button>
                </form>
            </Wrapper>
        )
    }
}

export default ProductEdit;