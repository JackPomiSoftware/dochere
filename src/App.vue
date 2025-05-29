<template>
  <div id="app">
    <div class="navbar">
      <div class="nav-links">
        <img src="/img/logo.png" alt="DocHere" class="navimg">
        <a href="#home">Анализы</a>
        <a href="#features">Диагностика</a>
        <a href="#donate">Новости</a>
        <a href="https://jackpomisoftware.github.io/">Pro-подписка</a>
        <a href="https://jackpomisoftware.github.io/">Режим доступности</a>
        <div style="width: 100px;"></div>
        <a href="https://jackpomisoftware.github.io/">Личный кабинет</a>
      </div>
    </div>
    
    <router-view />
    
    <div class="endbar">
      <div class="end-links">
        <a href="https://jackpomisoftware.github.io/">© 2025 DocHere</a>
        <div style="width: 100px;"></div>
        <a href="https://jackpomisoftware.github.io/">О компании</a>
        <a href="https://jackpomisoftware.github.io/">Помощь</a>
        <a href="https://jackpomisoftware.github.io/">Новости</a>
        <a href="https://jackpomisoftware.github.io/">Условия использования</a>
        <a href="https://jackpomisoftware.github.io/">Политика конфиденциальности</a>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script> 