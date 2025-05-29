<template>
  <div>
    <div class="hero">
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
    
    <div class="res-container">
      <div v-for="doctor in doctors" :key="doctor.id" class="res">
        <div class="res-panel-price">
          <button class="res-price">{{ doctor.price }}₽</button>
        </div>
        <div class="res-title">
          {{ doctor.name }}
        </div>
        <div class="res-subtitle">
          {{ doctor.specialty }}
        </div>
        <div class="res-text">
          {{ doctor.clinic }}
        </div>
        <div class="res-text">
          {{ doctor.metro }}
        </div>
        <div class="res-text">
          {{ doctor.phone }}
        </div>
        <div class="res-panel">
          <button 
            v-for="time in doctor.times" 
            :key="time" 
            class="res-time"
            @click="selectTime(doctor, time)"
          >
            {{ time }}
          </button>
          <button class="res-click" @click="book(doctor)">Записаться</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Results',
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
      },
      doctors: [
        {
          id: 1,
          name: 'Зубенко Михаил Петрович',
          specialty: 'Невролог',
          clinic: 'Клиника "Доброздрав" (ул. Люблинская, д. 153)',
          metro: 'Метро "Братиславская"',
          phone: '+7 (499) 555-35-35',
          price: 1500,
          times: ['12:40', '13:12', '15:00', '16:24', '16:40']
        },
        {
          id: 2,
          name: 'Попов Алексей Иванович',
          specialty: 'Невролог',
          clinic: 'Медицинский центр "Невроплюс" (ул. Маршала Баграмяна, д. 12)',
          metro: 'Метро "Братиславская"',
          phone: '+7 (499) 777-77-78',
          price: 1300,
          times: ['10:24', '11:12', '15:40']
        },
        {
          id: 3,
          name: 'Куйбышев Виктор Сергеевич',
          specialty: 'Невролог',
          clinic: 'Клиника "Фамильный Доктор" (ул. Белореченская, д. 77)',
          metro: 'Метро "Братиславская"',
          phone: '+7 (499) 564-33-57',
          price: 1600,
          times: ['10:56', '12:12', '13:46', '14:02']
        },
        {
          id: 4,
          name: 'Чкалов Леонид Андреевич',
          specialty: 'Невролог',
          clinic: 'Клиника "ВрачНеГрач" (ул. Марьинский Парк, д. 24)',
          metro: 'Метро "Марьино"',
          phone: '+7 (495) 353-21-63',
          price: 900,
          times: ['9:10', '9:12', '9:40', '10:34', '11:04', '11:18', '11:36']
        },
        {
          id: 5,
          name: 'Устинов Виталий Борисович',
          specialty: 'Невролог',
          clinic: 'Клиника "WinClinic" (ул. Донецкая, д. 2)',
          metro: 'Метро "Марьино"',
          phone: '+7 (495) 224-22-27',
          price: 1700,
          times: ['9:00', '9:16', '9:32', '9:48', '10:00', '10:16', '10:32']
        }
      ]
    }
  },
  mounted() {
    // Загружаем параметры поиска из URL
    this.searchForm = { ...this.$route.query }
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
    },
    selectTime(doctor, time) {
      console.log(`Выбрано время ${time} у врача ${doctor.name}`)
    },
    book(doctor) {
      alert(`Запись к врачу ${doctor.name}`)
    }
  }
}
</script> 