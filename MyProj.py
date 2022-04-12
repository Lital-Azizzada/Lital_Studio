from tkinter import font
import pymssql
import tkinter as mytk
from tkinter import *


my_main_color = '#5463FF'
my_oposite_color = '#ECECEC'
my_secondary_color ='#FFC300'
my_accent_color = '#FF1818'
# -----------------------------------------------

# initializing our main first window
tk_main_window = Tk()
tk_main_window.geometry("500x900")
tk_main_window.config(background=my_main_color)


def open_window_Trainer_report():
    # ---------------
    # a function to run when the button is clicked
    def read_the_TrainerName_and_run_my_query(the_frame):
        # lets clean screen from results of the previos cursor
        for element in the_frame.winfo_children():
            element.destroy()

        # lets take what the user typed into the text fields on the screen
        Trainer_Name = entry_Trainer.get()
       
        print(f'you selected dates, and city: {Trainer_Name} ')
        conn = pymssql.connect(host='localhost', database='StudioDB', password='1234', user='NewLogin', port='1433')
        my_crsr4 = conn.cursor()
     
        my_crsr4.execute(
            f"exec spWhichLessonsDoesTheTrainer @trainerName='{Trainer_Name}'")
       
        #  lets add labels and display on them the SP result on the screen:
        Label(the_frame,  bg=my_secondary_color, text="TrainerName", font=('calibri', 20)).grid(
            column=0, row=0, ipady=10)
        Label(the_frame,  bg=my_secondary_color, text="ClassName", font=('calibri', 20)).grid(
            column=1, row=0, ipady=10)
        Label(the_frame,  bg=my_secondary_color, text="ClassDate", font=('calibri', 20)).grid(
            column=2, row=0, ipady=10)
        Label(the_frame,  bg=my_secondary_color, text="HourClass", font=('calibri', 20)).grid(
            column=3, row=0, ipady=10)

        for i, my_curr_row in enumerate(my_crsr4):
            for j, curr_col in enumerate(my_curr_row):
                st3 = f'{curr_col}'
                print(st3)
                Label(the_frame, text=st3, bg=my_secondary_color, font=('calibri', 20), padx=5, pady=5).grid(
                    row=i+1, column=j)
        conn.close()
    # ----------------
    new_window = Toplevel(tk_main_window)
    new_window.title("Trainer Report")
    new_window.geometry("1200x900")
    new_window.configure(bg=my_main_color)

    # lets add two "frames" on the screen,
    # on the upper frame the user will have text fields to type input,
    #  and on the lower frame we will display the results

    upperframe = Frame(new_window, bg=my_main_color)
    upperframe.pack(side=TOP)

    bottomframe = Frame(new_window, bg=my_secondary_color)
    bottomframe.pack(pady=30)

    # on the upper frame:
    
    label_Trainer = Label(upperframe, text="Trainer name",
                        bg=my_main_color, fg=my_secondary_color, font=('calibri', 28))
    entry_Trainer = Entry(upperframe, bg=my_main_color,
                        fg=my_secondary_color, font=('calibri', 22))

    btn = Button(upperframe, text="Run my query with the chosen trainer name",
                 font=('calibri', 22),
                 background=my_accent_color,
                 highlightbackground=my_accent_color,
                 command=lambda: read_the_TrainerName_and_run_my_query(bottomframe))

    label_Trainer.grid(row=0, column=1, padx=20, pady=5)
    
    
    entry_Trainer.grid(row=1, column=1, padx=20, pady=5, ipady=5)
  
    
    # pad much (40) below the button, and pad just a little less (30) above it
    #    and stretch it a little (5) on both directions, x and y
    btn.grid(row=2, column=1, pady=(30, 40), ipady=(5), ipadx=5)


def open_window_Lesson_details():

    # a function to run when the button is clicked
    def read_the_date_and_run_my_query(the_frame):
        # lets clean screen from results of the previos cursor
        for element in the_frame.winfo_children():
            element.destroy()

        # lets take what the user typed into the text fields on the screen
        Lesson = entry_Lesson.get()
        Date = entry_date.get()
        Hour = entry_Hour.get()
        print(f'you selected dates, and city: {Lesson} {Date} {Hour}')
        conn = pymssql.connect(host='localhost', database='StudioDB', password='1234', user='NewLogin', port='1433')
        my_crsr4 = conn.cursor()
        
        my_crsr4.execute(
            f"exec spLessonDetail @LessonName='{Lesson}', @LessonDate='{Date}', @LessonHour='{Hour}'")
        
        #  lets add labels and display on them the SP result on the screen:
        Label(the_frame,  bg=my_secondary_color, text="Customer name", font=('calibri', 20)).grid(
            column=0, row=0, ipady=10)
        Label(the_frame,  bg=my_secondary_color, text="Trainer name", font=('calibri', 20)).grid(
            column=1, row=0, ipady=10)
        Label(the_frame,  bg=my_secondary_color, text="Price", font=('calibri', 20)).grid(
            column=2, row=0, ipady=10)
        Label(the_frame,  bg=my_secondary_color, text="Class number", font=('calibri', 20)).grid(
            column=3, row=0, ipady=10)

        for i, my_curr_row in enumerate(my_crsr4):
            for j, curr_col in enumerate(my_curr_row):
                st3 = f'{curr_col}'
                print(st3)
                Label(the_frame, text=st3, bg=my_secondary_color, font=('calibri', 20), padx=5, pady=5).grid(
                    row=i+1, column=j)
        conn.close()
    # ----------------
    new_window = Toplevel(tk_main_window)
    new_window.title("Lesson details")
    new_window.geometry("1200x900")
    new_window.configure(bg=my_main_color)

    # lets add two "frames" on the screen,
    # on the upper frame the user will have text fields to type input,
    #  and on the lower frame we will display the results

    upperframe = Frame(new_window, bg=my_main_color)
    upperframe.pack(side=TOP)

    bottomframe = Frame(new_window, bg=my_secondary_color)
    bottomframe.pack(pady=30)

    # on the upper frame:
   
    label_Lesson = Label(upperframe, text="Lesson name",
                        bg=my_main_color, fg=my_secondary_color, font=('calibri', 28))
    entry_Lesson = Entry(upperframe, bg=my_main_color,
                        fg=my_secondary_color, font=('calibri', 22))

    label_date = Label(upperframe, text="Date",
                        bg=my_main_color, fg=my_secondary_color, font=('calibri', 28))
    entry_date = Entry(upperframe, bg=my_main_color,
                        fg=my_secondary_color, font=('calibri', 22))

    label_Hour = Label(upperframe, text="Hour",
                       bg=my_main_color, fg=my_secondary_color, font=('calibri', 28))
    entry_Hour = Entry(upperframe, bg=my_main_color,
                           fg=my_secondary_color, font=('calibri', 22))

    btn = Button(upperframe, text="Run my query with the chosen dates",
                 font=('calibri', 22),
                 background=my_accent_color,
                 highlightbackground=my_accent_color,
                 command=lambda: read_the_date_and_run_my_query(bottomframe))

    label_Lesson.grid(row=0, column=0, padx=20, pady=5)
    label_date.grid(row=0, column=1, padx=20, pady=5)
    label_Hour.grid(row=0, column=2, padx=20, pady=5)
    entry_Lesson.grid(row=1, column=0, padx=20, pady=5, ipady=5)
    entry_date.grid(row=1, column=1, padx=20, pady=5, ipady=5)
    entry_Hour.grid(row=1, column=2, padx=20, pady=5, ipady=5)

    btn.grid(row=2, column=1, pady=(30, 40), ipady=(5), ipadx=5)



# ----------------------------------------------------------------------


def open_new_window_for_agents_report():
    newWindow = Toplevel(tk_main_window)
    newWindow.title("Agents Report")
    newWindow.geometry("500x500")
    label1 = Label(newWindow, text="Agents Report 8)").pack(pady=10)

def open_window_TotalRevenuePerDay():
    # ---------------
    # a function to run when the button is clicked
    def read_the_date_and_run_my_query(the_frame):
        # lets clean screen from results of the previos cursor
        for element in the_frame.winfo_children():
            element.destroy()

        # lets take what the user typed into the text fields on the screen
        date = entry_date.get()
       
        print(f'you selected date, and city: {date}')
        conn = pymssql.connect(host='localhost', database='StudioDB', password='1234', user='NewLogin', port='1433')
        my_crsr4 = conn.cursor()
       
        my_crsr4.execute(
            f"exec spTotalRevenuePerDay @date='{date}'")
        

        #  lets add labels and display on them the SP result on the screen:
        Label(the_frame,  bg=my_secondary_color, text="Sum", font=('calibri', 20)).grid(
            column=0, row=0, ipady=10)
        

        for i, my_curr_row in enumerate(my_crsr4):
            for j, curr_col in enumerate(my_curr_row):
                st3 = f'{curr_col}'
                print(st3)
                Label(the_frame, text=st3, bg=my_secondary_color, font=('calibri', 20), padx=5, pady=5).grid(
                    row=i+1, column=j)
        conn.close()
    # ----------------
    new_window = Toplevel(tk_main_window)
    new_window.title("Orders Report")
    new_window.geometry("1200x900")
    new_window.configure(bg=my_main_color)

    # lets add two "frames" on the screen,
    # on the upper frame the user will have text fields to type input,
    #  and on the lower frame we will display the results

    upperframe = Frame(new_window, bg=my_main_color)
    upperframe.pack(side=TOP)

    bottomframe = Frame(new_window, bg=my_secondary_color)
    bottomframe.pack(pady=30)

    # on the upper frame:
    
    label_date = Label(upperframe, text="Date",
                        bg=my_main_color, fg=my_secondary_color, font=('calibri', 28))
    entry_date = Entry(upperframe, bg=my_main_color,
                        fg=my_secondary_color, font=('calibri', 22))


    btn = Button(upperframe, text="Run my query with the chosen date",
                 font=('calibri', 22),
                 background=my_accent_color,
                 highlightbackground=my_accent_color,
                 command=lambda: read_the_date_and_run_my_query(bottomframe))

    label_date.grid(row=0, column=1, padx=20, pady=5)
   
    entry_date.grid(row=1, column=1, padx=20, pady=5, ipady=5)
   
    # pad much (40) below the button, and pad just a little less (30) above it
    #    and stretch it a little (5) on both directions, x and y
    btn.grid(row=2, column=1, pady=(30, 40), ipady=(5), ipadx=5)


# ---------------------------------------------------------------------------------


# Add Button and Label
Label(tk_main_window, text="First Window",
      foreground=my_accent_color,
      background=my_main_color,
      font=("Calibri", 60)).pack(ipady=30, ipadx=30, pady=10)

Button(tk_main_window, text="Trainer Report",
       foreground=my_accent_color,
       background=my_secondary_color,
       highlightbackground=my_secondary_color,
       font=("Calibri", 18),
       command=open_window_Trainer_report).pack(ipady=30, ipadx=30,padx=20, pady=5)

Button(tk_main_window, text="Lesson details",
       foreground=my_accent_color,
       background=my_secondary_color,
       highlightbackground=my_secondary_color,
       font=("Calibri", 18),
       command=open_window_Lesson_details).pack(ipady=30, ipadx=30,padx=20, pady=5)

Button(tk_main_window, text="Total Revenue Per Day",
       foreground=my_accent_color,
       background=my_secondary_color,
       highlightbackground=my_secondary_color,
       font=("Calibri", 18),
       command=open_window_TotalRevenuePerDay).pack(ipady=30, ipadx=30,padx=20, pady=5)

mainloop()

