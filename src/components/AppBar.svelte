<script>
  import { onMount } from 'svelte';

  // Handle the search functionality
  let searchQuery = '';

  const handleSearch = () => {
    //TODO: create something to search
    console.log('Search query:', searchQuery);
  };

  let isMobile = false;

  onMount(() => {
    isMobile = window.innerWidth <= 768;

    window.addEventListener('resize', () => {
      isMobile = window.innerWidth <= 768;
    });

    return () => {
      window.removeEventListener('resize');
    };
  });
</script>

<style>
    .app-bar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1rem;
      background-color: #0064a8;
      color: #fff;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
      height: 100%;
      widows: 100%;
    }
  
    .brand {
      font-size: 1.5rem;
      font-weight: bold;
      margin-right: 1rem;
      color: #fff;
      text-decoration: none;
    }
  
    .search-bar {
      display: flex;
      align-items: center;
    }
  
    input {
      margin-right: 1rem;
      padding: 0.5rem;
      border: none;
      border-radius: 4px;
    }
  
    button {
      padding: 0.5rem 1rem;
      background-color: #fff;
      color: #0064a8;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
  
    @media (max-width: 768px) {
      .search-bar {
        flex-direction: column;
        align-items: flex-start;
      }
  
      input {
        margin-right: 0;
        margin-bottom: 0.5rem;
      }
    }
  </style>

<header class="app-bar">
    <a href="/" class="brand">ETH FUND</a>
    <div class="search-bar">
      {#if isMobile}
        <input type="text" placeholder="Search..." />
        <button>Search</button>
      {:else}
        <input type="text" placeholder="Search Fundraisers..." />
        <button>Search</button>
      {/if}
    </div>
</header>