# Vending Machine FSM Simulator

## 🚀 Overview

A web-based simulator that visualizes a Verilog Finite State Machine (FSM) for a vending machine. This project converts hardware logic into an interactive browser experience, making digital design concepts easy to understand for everyone.

The vending machine accepts ₹5 and ₹10 coins and dispenses two different products based on the amount collected.

## 💡 Why This Project?

I created the FSM logic in Verilog from scratch as part of my digital logic course. While the HDL implementation worked perfectly, it was only understandable by technical people. I wanted to demonstrate the state changes in a more intuitive and visual way.

That's when AI stepped in! Google Gemini helped me convert my Verilog FSM logic into an HTML and JavaScript simulator that displays the behavior live in the browser. Now anyone can understand how the vending machine works!

## 🛠️ Technologies

- **Verilog** - Original FSM design (written by me)
- **HTML/CSS** - Web interface
- **JavaScript** - Simulation logic
- **Google Gemini AI** - Assisted in converting my Verilog logic to web visualization

## ✨ Features

- Real-time state transition visualization
- Interactive coin input (₹5 and ₹10)
- Displays current state and accumulated amount
- Product dispensing simulation
- No installation needed - runs in browser

## 🚀 How to Use

1. Clone this repository
2. Open `index.html` in your web browser
3. Click coin buttons to insert money
4. Watch the FSM states change in real-time
5. See products dispense when enough money is collected

## 📁 Project Structure

```
vending-machine-fsm/
├── index.html           # Main simulator page
├── js/
│   └── fsm.js          # FSM logic
├── css/
│   └── styles.css      # Styling
├── verilog/
│   └── vending_machine.v  # Original Verilog code
└── README.md
```

## 💭 Future Ideas

- Support for more coin types
- Change return feature
- Multiple products
- Transaction history
- Mobile-friendly design

## 👨‍💻 Author

**Manikanta Raghava Naragam**

Connect with me on [LinkedIn](https://www.linkedin.com/in/manikanta-raghava-naragam-0498182ba/)

## 🤝 Contributing

Feel free to fork this project and submit pull requests. All contributions are welcome!

---

⭐ Star this repo if you find it useful!

**Tags**: #Verilog #FSM #DigitalLogic #HardwareDesign #WebDevelopment #AIinEngineering #EdTech
