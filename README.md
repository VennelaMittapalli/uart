******************************************************************************************UART******************************************************************************************

UART stands for Universal Asynchronous Receiver Tranmitter which is communication protocol for the Serial Data Transmission. It converts the data from serial to parallel or from parallel to serial. 

*******************************************************************************************************************************************************************

************************************************************************************TRANSMITER************************************************************************************

=> 1. The input to the Transmiter is provided from the on-board switches gets transmited based on the Transmit signal which gets activated based on the Push button which needs to pressed for the threshold the 
clock pulses

=> 2. Once the transmit signal is High then the transmiter based on the data received it forms the data format i.e. it loads the data
[ STOP [USUALLY 0], DATA [WE HERE USE 8 BIT DATA IN FROM OF ASCII VALUES OF KEY],STOP BIT[1]]

=> 3. Then it performs the shift operation based on the counter reaching the respective clock pulses it shifts bit by bit to the output of transmiter 

=> 4. The output can be viewed in the Tera Term window

=> 5. If the bitcount reaches to 10 then it reaches to initial state

*******************************************************************************************************************************************************************

**************************************************************************************RECEIVER************************************************************************************

FSM


<img width="897" height="1006" alt="image" src="https://github.com/user-attachments/assets/406c1094-bec1-4c1b-8922-eb8009edf50c" />


------------------------------------------------------------------------------------------------------------------------------------------------------------------


UART SCHEMATIC



<img width="1215" height="848" alt="image" src="https://github.com/user-attachments/assets/7474f1e9-06ed-467f-96c3-7f796f2017f1" />



UART RECEIVER 



<img width="1884" height="565" alt="image" src="https://github.com/user-attachments/assets/b95c1a0f-b4d6-45e4-8c62-f13292eb62d9" />


UART TRANSMITTER




<img width="1821" height="653" alt="image" src="https://github.com/user-attachments/assets/5d4fe480-9c6d-4a5d-9c85-8fb1b6740f5b" />



------------------------------------------------------------------------------------------------------------------------------------------------



FPGA OUTPUT

<img width="876" height="632" alt="image" src="https://github.com/user-attachments/assets/b890f67a-beb5-423a-acf0-e399dc7c15c9" />

TERA TERM OUTPUT 

<img width="1149" height="794" alt="image" src="https://github.com/user-attachments/assets/f1700c8e-29ea-41d7-b2f4-c3a46eb43969" />


