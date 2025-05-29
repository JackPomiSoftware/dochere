<template>
  <div>
    <div class="hero">
      <div class="hero-title">
        Услуга за один клик
      </div>
      <div class="heroimg">
        <table id="forms" cellpadding="1px">
          <div class="search-inputs-background">
            <tr>
              <td colspan="2">
                <input 
                  type="text" 
                  v-model="searchForm.symptome" 
                  placeholder="Услуга, врач, клиника, симптом"
                  id="symptome"
                >
              </td>
              <td colspan="2">
                <input 
                  type="text" 
                  v-model="searchForm.district" 
                  placeholder="Метро, район, округ, город"
                  id="district"
                >
              </td>
            </tr>
            <tr>
              <td>
                <input 
                  type="text" 
                  v-model="searchForm.priceFrom" 
                  placeholder="Цена от, ₽"
                  id="pricefrom"
                >
              </td>
              <td>
                <input 
                  type="text" 
                  v-model="searchForm.priceTo" 
                  placeholder="до"
                  id="priceto"
                >
              </td>
              <td>
                <input 
                  :type="dateFieldType"
                  v-model="searchForm.date" 
                  placeholder="Когда"
                  @focus="handleDateFocus"
                  @blur="handleDateBlur"
                  min="2025-06-01"
                  id="date"
                />
              </td>
              <td>
                <button @click="search" id="find">Найти</button>
              </td>
            </tr>
          </div>
          <tr>
            <td colspan="4" id="chx">
              <label for="children">
                <input 
                  type="checkbox" 
                  v-model="searchForm.children" 
                  id="children"
                >
                <span class="checkmark"></span>
                Детский врач
              </label>
              <label for="dms">
                <input 
                  type="checkbox" 
                  v-model="searchForm.dms" 
                  id="dms"
                >
                <span class="checkmark"></span>
                По полису ДМС
              </label>
            </td>
          </tr>
        </table>
        <img class="hero-image" src="/img/lizard.png">
      </div>
    </div>
    
    <div class="adv-container">
      <div class="adv1">
        <div class="adv-title">
          Врачи без переплат
        </div>
        <div class="adv-subtitle">
          Цены от 1000₽
        </div>
        <button class="adv-click">Записаться</button>
      </div>
      <div class="adv2">
        <div class="adv-title">
          Анализы от 500₽
        </div>
        <div class="adv-subtitle">
          Выгода до 50 %
        </div>
        <button class="adv-click">Выбрать анализы</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Home',
  data() {
    return {
      dateFieldType: 'text', // Initial type for placeholder
      searchForm: {
        symptome: '',
        district: '',
        priceFrom: '',
        priceTo: '',
        date: '', // Initially empty for placeholder
        children: false,
        dms: false
      }
    }
  },
  methods: {
    search() {
      // Переход на страницу результатов с параметрами поиска
      this.$router.push({
        path: '/results',
        query: this.searchForm
      })
    },
    handleDateFocus() {
      this.dateFieldType = 'date';
    },
    handleDateBlur() {
      if (!this.searchForm.date) {
        this.dateFieldType = 'text';
      } else {
        this.dateFieldType = 'date';
      }
    }
  }
}
</script> 