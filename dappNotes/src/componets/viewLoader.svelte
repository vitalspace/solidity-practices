<script lang="ts">
  import Evaluate from "./evaluate.svelte";
  import GetNotesById from "./getNotesById.svelte";
  import GetRequest from "./getRequest.svelte";
  import RequestRevision from "./requestRevision.svelte";

  let currentView:number = 0;
  const views = [Evaluate, RequestRevision, GetNotesById, GetRequest];
  let viewportComponent = views[0];

  const updateViewportComponent = (component:number) => {
    currentView = component;
    viewportComponent = views[component];
  };

    updateViewportComponent(3);
  function evaluateButton() {
    updateViewportComponent(0);
  }

  function requestRevisionButton() {
    updateViewportComponent(1);
  }

  function getNotesByIdButton() {
    updateViewportComponent(2);
  }

  function getRequestButton() {
    updateViewportComponent(3);
  }
</script>

<div>
  <button class="bg-blue-500 text-white px-2 py-2" on:click={evaluateButton}
    >Evaluate</button
  >
  <button
    class="bg-blue-500 text-white px-2 py-2"
    on:click={requestRevisionButton}>Request Revision</button
  >
  <button class="bg-blue-500 text-white px-2 py-2" on:click={getNotesByIdButton}
    >Get note by id</button
  >
  <button class="bg-blue-500 text-white px-2 py-2" on:click={getRequestButton}
    >Get Request</button
  >
</div>

{#if viewportComponent == views[currentView]}
  <div id="viewport">
    <svelte:component this={viewportComponent} />
  </div>
{/if}
