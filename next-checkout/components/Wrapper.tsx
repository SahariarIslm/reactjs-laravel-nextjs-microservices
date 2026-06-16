import React from 'react';
import Head from "next/head";
import Script from 'next/script';
const Wrapper = (props) => {
    return (
        <div>
            <Script
                src="https://js.stripe.com/v3/"
                strategy="afterInteractive"
            />
            <div className="container">
                {props.children}
            </div>
        </div>
    );
};

export default Wrapper;