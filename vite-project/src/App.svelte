<script>
  import Login from "./componets/Login.svelte";
  import UserWalletId from "./componets/UserWalletId.svelte";
  import { App } from "./lib/App";
// import { isLoggedIn } from './stores/stores'
  import ViewLoader from "./componets/viewLoader.svelte";

  const app = new App();
  app.init();
</script>

<div class="container text-center mx-auto">
  <!-- {$isLoggedIn} -->
  <Login />
  <UserWalletId />
  <ViewLoader />
</div>
