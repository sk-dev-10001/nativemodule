import React from 'react';
import {Button} from 'react-native';
import CalendarModule from './src/NativeModule';

const App = () => {
  const onPress = () => {
    CalendarModule.createCalendarEvent('Party', 'My House', eventId => {
      console.log(`Created a new event with id ${eventId}`);
    });
  };

  return (
    <Button
      title="Click to invoke your native module!"
      color="#841584"
      onPress={onPress}
    />
  );
};

export default App;
