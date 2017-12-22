import React from 'react';
import { View } from 'react-native';
import Heading from './components/heading.js';

const App = () => {
  const { container } = styles;
  return (
  <View style={container}>
    <Heading />
  </View>
  );
};


const styles = {
  container: {
    flex: 1,
    backgroundColor: '#FFFFFF',
  }
};

export default App;
