<script>
    import { isLoggedIn, userWalletId } from '../stores/stores'
</script>

{#if $isLoggedIn}
  <div>
    <h3>Hello: {$userWalletId}</h3>
  </div>
{/if}