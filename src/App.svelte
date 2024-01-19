<script>
  import { Route, Router } from 'svelte-routing';
  import Home from './pages/Home.svelte';
  import FundraiserDetails from './pages/FundraiserDetails.svelte';
  import AppBar from './components/AppBar.svelte';
</script>

<style>
  body, html {
    margin: 0;
    padding: 0;
    font-family: 'Helvetica Neue', sans-serif;
    background-color: #f9f9f9;
    color: #333;
  }

  #app {
    height: 100vh; /* Use 100% of the viewport height */
  }

  .container {
    margin: 0 auto;
    padding: 20px;
  }

  /* Custom styles for links */
  a {
    color: #0064a8;
    text-decoration: none;
    transition: color 0.3s;
  }

  a:hover {
    color: #003366;
  }
</style>

<div id="app">
  <Router>
    <div class="container">
      <AppBar />

      <Route path="/" component={Home} />
      <Route path="/fundraisers/:slug" component={FundraiserDetails} />
    </div>
  </Router>
</div>