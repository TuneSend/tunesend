import React, {Component} from 'react';
import { AppRegistry, StyleSheet, Text, View } from 'react-native';
import Heading from './heading.js';

export default class App extends React.Component {
  render() {
    return (
    <View style={styles.container}>
      <Heading />
    </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#FFFFFF',
  },
});

AppRegistry.registerComponent('App', ()=> App );