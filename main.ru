from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.button import Button
from kivy.uix.textinput import TextInput
from kivy.uix.label import Label
from kivy.core.window import Window

Window.clearcolor = (0.1, 0.1, 0.1, 1)

class OSINTApp(App):
    def build(self):
        layout = BoxLayout(orientation='vertical', spacing=10, padding=10)
        
        self.input_field = TextInput(
            hint_text='Введи номер/почту/логин',
            size_hint=(1, 0.1),
            font_size=20
        )
        layout.add_widget(self.input_field)
        
        btn_phone = Button(text='По номеру', size_hint=(1, 0.1), font_size=18)
        btn_phone.bind(on_press=self.search_phone)
        layout.add_widget(btn_phone)
        
        btn_email = Button(text='По email', size_hint=(1, 0.1), font_size=18)
        btn_email.bind(on_press=self.search_email)
        layout.add_widget(btn_email)
        
        btn_username = Button(text='По логину', size_hint=(1, 0.1), font_size=18)
        btn_username.bind(on_press=self.search_username)
        layout.add_widget(btn_username)
        
        self.result_label = Label(
            text='Результат...',
            size_hint=(1, 0.6),
            text_size=(500, None),
            valign='top',
            font_size=16
        )
        layout.add_widget(self.result_label)
        
        return layout
    
    def search_phone(self, instance):
        phone = self.input_field.text
        self.result_label.text = f'Поиск номера: {phone}\nСтатус: ищем...'
        
    def search_email(self, instance):
        email = self.input_field.text
        self.result_label.text = f'Поиск email: {email}\nСтатус: ищем...'
        
    def search_username(self, instance):
        username = self.input_field.text
        self.result_label.text = f'Поиск логина: {username}\nСтатус: ищем...'
if __name__ == '__main__':
    OSINTApp().run()
