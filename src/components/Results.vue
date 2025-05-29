<template>
  <div>
    <div class="hero">
      <div class="heroimg">
        <table id="forms" cellpadding="1px">
          <tr>
            <td colspan="4" style="height: 30px;"></td>
            <td rowspan="4">
              <img class="hero-image" src="/img/lizard.png">
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <input 
                type="text" 
                v-model="searchForm.symptome" 
                placeholder="Услуга, врач, клиника, симптом"
              >
            </td>
            <td colspan="2">
              <input 
                type="text" 
                v-model="searchForm.district" 
                placeholder="Метро, район, округ, город"
              >
            </td>
          </tr>
          <tr>
            <td>
              <input 
                type="text" 
                v-model="searchForm.priceFrom" 
                placeholder="Цена от, ₽"
              >
            </td>
            <td>
              <input 
                type="text" 
                v-model="searchForm.priceTo" 
                placeholder="до"
              >
            </td>
            <td>
              <input 
                type="date" 
                v-model="searchForm.date" 
                min="2025-06-01"
              />
            </td>
            <td>
              <button @click="search">Найти</button>
            </td>
          </tr>
          <tr>
            <td colspan="2" id="chx">
              <label for="children">
                <input 
                  type="checkbox" 
                  v-model="searchForm.children" 
                  id="children"
                >
                Детский врач
              </label>
              <label for="dms">
                <input 
                  type="checkbox" 
                  v-model="searchForm.dms" 
                  id="dms"
                >
                По полису ДМС
              </label>
            </td>
          </tr>
        </table>
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
      searchForm: {
        symptome: '',
        district: '',
        priceFrom: '',
        priceTo: '',
        date: '',
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
      // Обновляем результаты поиска
      console.log('Поиск с параметрами:', this.searchForm)
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