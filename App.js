import {
  SafeAreaView,
  View,
  NativeModules,
  NativeEventEmitter,
  Button,
} from 'react-native';
import React, {useEffect} from 'react';
import styles from './app.styles';
const App = () => {
  const counterevent = new NativeEventEmitter(NativeModules.CounterEvent);

  const IosBridge = () => {
    console.log(
      '::',
      NativeModules.Counter,
      NativeModules.Counter.Increment(value => console.log('value:', value)),
      NativeModules.Counter.getConstants(),
    );
  };

  useEffect(() => {
    counterevent.addListener('onIncrement', result =>
      console.log('i - result', result),
    );
    counterevent.addListener('onDecrement', result =>
      console.log('d - result', result),
    );
    return () => {
      counterevent.removeAllListeners();
    };
  });
  // promise based native module call
  const decrementCount = async () => {
    try {
      const count = await NativeModules.Counter.Decrement();
      console.log('Decrement:', count);
    } catch (error) {
      console.log('Error:', error.message, error.code);
    }
  };
  // callback based nativemodule call
  const IncrementCount = () => {
    NativeModules.Counter.Increment(value => console.log('value:', value));
  };
  // event emitter using promise
  const decrementEvent = async () => {
    try {
      const count = await NativeModules.CounterEvent.decrement();
      console.log('Decrement event:', count);
    } catch (error) {
      console.log('Error:', error.message, error.code);
    }
  };

  // event emitter using callback
  const IncrementEvent = () => {
    NativeModules.CounterEvent.increment(value =>
      console.log('value event:', value),
    );
  };

  return (
    <SafeAreaView>
      <View style={styles.appContainer} />
      <Button onPress={IosBridge} title="IOS BRIDGE TEST" color="blue" />
      <Button onPress={IncrementCount} title="Increment" color="blue" />
      <Button onPress={decrementCount} title="Decrease" color="blue" />

      <Button onPress={IncrementEvent} title="Increment Event" color="blue" />
      <Button onPress={decrementEvent} title="Decrease Event" color="blue" />
    </SafeAreaView>
  );
};
export default App;
