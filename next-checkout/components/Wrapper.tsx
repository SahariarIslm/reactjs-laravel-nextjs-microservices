import React from 'react';
import Head from "next/head";
const Wrapper = (props) => {
    return (
        <div>
            <Head>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
            </Head>
            <div className="container">
                {props.children}
            </div>
        </div>
    );
};

export default Wrapper;