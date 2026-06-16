"use client";

import React, { useEffect } from "react";
import axios from "axios";
import { useSearchParams } from "next/navigation";
import constants from "@/constants";
import Wrapper from "@/components/Wrapper";

const Success = () => {
  const searchParams = useSearchParams();
  const source = searchParams.get("source");

  useEffect(() => {
    if (source) {
      (async () => {
        await axios.post(`${constants.endpoint}/orders/confirm`, {
          source,
        });
      })();
    }
  }, [source]);
    return (
        <Wrapper>
            <div className="py-5 text-center">
                <h2>Success</h2>
                <p className="lead">
                    Your purchase has been completed!
                </p>
            </div>
        </Wrapper>
    );
};

export default Success;