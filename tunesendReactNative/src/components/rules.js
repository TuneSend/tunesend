import React from 'react';
import {Image,
      AppRegistry,
      StyleSheet,
      Text,
      View
    } from 'react-native';


export default class Rules extends React.Component {
	render() {
		return(
			<View style={styles.fill}>
				<Image style={styles.ImageSize} source={require('../image/test/number1.jpg')} />
				<Image style={styles.ImageSize} source={require('../image/test/number2.jpg')} />
				<Image style={styles.ImageSize} source={require('../image/test/number3.jpg')} />

			</View>
		)
	}
}

const styles = StyleSheet.create({
	fill: {
		flex: 1,
	},
	ImageSize: {
    	flex: 1,
    	width: null,
    	height: null,
    	resizeMode: 'cover',
    	alignItems: 'center',
	},
})

AppRegistry.registerComponent('Rules', () => Rules);