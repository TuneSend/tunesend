import React from 'react';
import { AppRegistry, View } from 'react-native';
import Heading from './src/components/Heading';

const App = () => (
	// expand component to fill the entire content area of the device
	<View>
		<Heading />
	</View>
);

AppRegistry.registerComponent('tunesendReactNative', () => App);
