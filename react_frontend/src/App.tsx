import React from 'react';
import { ApolloClient } from '@apollo/client'
import { ApolloProvider, InMemoryCache } from "@apollo/react-hooks"
import Demo from "./Demo";

const client:any = new ApolloClient({
  uri: "http://localhost:3000/graphql",
  cache: new InMemoryCache()
})

const App = () => {
    return (
        <ApolloProvider client={client} >
            <div className="App">
                <Demo/>
            </div>
        </ApolloProvider>
    );
}

export default App;