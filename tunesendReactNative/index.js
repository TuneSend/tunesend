import React from 'react';
import { AppRegistry, View } from 'react-native';
import TuneSend from './src/TuneSend';

const App = () => (
	<View>
		<TuneSend />
	</View>
);

AppRegistry.registerComponent('TuneSend', () => App);
