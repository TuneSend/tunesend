import React from 'react';
import { View } from 'react-native';
import Heading from './components/Heading.js';
import Instructions from './components/Instructions';

const TuneSend = () => {
  const { container } = styles;
  return (
  <View style={container}>
    <Heading />
    <Instructions />
  </View>
  );
};


const styles = {
  container: {
    flex: 1,
    backgroundColor: '#FFFFFF',
  }
};

export default TuneSend;
