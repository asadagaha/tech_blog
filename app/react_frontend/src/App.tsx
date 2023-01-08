import React from 'react';
import { ApolloClient } from '@apollo/client'
import { ApolloProvider, InMemoryCache } from "@apollo/react-hooks"
import Header from "./components/Header"
import BlogPosts from "./Blogposts";


const client:any = new ApolloClient({
  uri: `http://localhost:3000/graphql`,  //変数化をしたい#
  cache: new InMemoryCache()
})

const App = () => {
    return (
        <ApolloProvider client={client} >
            <div className="App">
                <Header/>
                <BlogPosts/>
            </div>
        </ApolloProvider>
    );
}

export default App;