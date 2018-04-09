import React, { Component } from 'react';
import { View, Text, Image, StyleSheet } from 'react-native';
import styles from '../stylesheets/styles';

class Instructions extends Component {

    render() {
        const {
            TextContainer,
            TextViewWithMargin,
            TextFormat,
            IconFormat,
            FullAccessText
        } = styles;

        return (
            <View style={TextContainer}>
                <View
                    style={StyleSheet.flatten([
                        TextViewWithMargin,
                        {
                            borderBottomColor: 'rgba(0, 0, 0, 0.2)',
                            borderBottomWidth: 2,
                            marginBottom: 16,
                            marginTop: 30
                        }
                    ])}
                >
                    <Text
                        style={StyleSheet.flatten([
                            TextFormat,
                            {
                                fontSize: 24,
                                marginTop: 0,
                                marginBottom: 6
                            }
                        ])}
                    >
                    How To Use
                    </Text>
                    <Text
                        style={StyleSheet.flatten([
                            TextFormat,
                            {
                                color: '#55b2f9',
                                paddingLeft: 6,
                                fontSize: 24,
                                marginTop: 0,
                                marginBottom: 6
                            }
                        ])}
                    >
                        Tune
                    </Text>
                    <Text
                        style={StyleSheet.flatten([
                            TextFormat,
                            {
                                color: '#f6be5f',
                                fontSize: 24,
                                paddingRight: 5,
                                marginTop: 0,
                                marginBottom: 6
                            }
                        ])}
                    >
                        Send
                    </Text>
                </View>
                <View style={TextViewWithMargin}>
                        <Text
                            style={StyleSheet.flatten([
                                TextFormat,
                                {
                                    paddingLeft: 12
                                }
                            ])}
                    >
                        Switch to
                    </Text>
                    <Text
                        style={StyleSheet.flatten([
                            TextFormat,
                            {
                                color: '#55b2f9',
                                paddingLeft: 6
                            }
                        ])}
                    >
                        Tune
                    </Text>
                    <Text
                        style={StyleSheet.flatten([
                            TextFormat,
                            {
                                color: '#f6be5f',
                                paddingRight: 5
                            }
                        ])}
                    >
                        Send
                    </Text>
                    <Image
                        style={StyleSheet.flatten([
                            IconFormat,
                            {
                                width: 23,
                                height: 23,
                                marginTop: 18,
                                marginLeft: 7,
                            }
                        ])}
                        source={require('../image/globeKey3.png')}
                    />
                </View>
                <View style={TextViewWithMargin}>
                        <Text 
                            style={StyleSheet.flatten([
                                TextFormat,
                                {
                                    paddingLeft: 12
                                }
                            ])}
                    >
                        Type your
                    </Text>
                    <Text
                        style={StyleSheet.flatten([
                            TextFormat,
                            {
                                color: '#55b2f9',
                                paddingLeft: 6
                            }
                        ])}
                    >
                        Mes
                    </Text>
                    <Text
                        style={StyleSheet.flatten([
                            TextFormat,
                            {
                                color: '#f6be5f',
                                paddingRight: 5
                            }
                        ])}
                    >
                        sage
                    </Text>
                    <Image
                        style={StyleSheet.flatten([
                            IconFormat,
                            {
                                resizeMode: 'contain',
                                width: 65,
                                marginTop: 16,
                                marginBottom: 15,
                                marginLeft: 7
                            }
                        ])}
                        source={require('../image/TuneSendKeyboard.png')}
                    />
                </View>
                <View 
                    style={StyleSheet.flatten([
                        TextViewWithMargin,
                        {
                            marginBottom: 0
                        }
                    ])}
                >
                        <Text
                            style={StyleSheet.flatten([
                                TextFormat,
                                {
                                    paddingLeft: 12
                                }
                            ])}
                    >
                        Press the
                    </Text>
                    <Text
                        style={StyleSheet.flatten([
                            TextFormat,
                            {
                                color: '#55b2f9',
                                paddingLeft: 6
                            }
                        ])}
                    >
                        Play
                    </Text>
                    <Text
                        style={StyleSheet.flatten([
                            TextFormat,
                            {
                                color: '#f6be5f',
                                paddingLeft: 5
                            }
                        ])}
                    >
                        Button
                    </Text>
                    <Image
                        style={StyleSheet.flatten([
                            IconFormat,
                            {
                                resizeMode: 'contain',
                                width: 45,
                                marginTop: 12,
                                marginBottom: 15,
                                marginLeft: 9
                            }
                        ])}
                        source={require('../image/playButtonDisplay.png')}
                    />
                </View>
                <View style={TextViewWithMargin}>
                    <Text style={FullAccessText}>
                        When the Play Button is pressed,
                        TuneSend plays back your message
                        and creates a musical recording of it.{"\n"}
                    </Text>
                </View>
                <View style={TextViewWithMargin}>
                        <Text
                            style={StyleSheet.flatten([
                                TextFormat,
                                {
                                    paddingLeft: 12
                                }
                            ])}
                    >
                        Paste the
                    </Text>
                    <Text
                        style={StyleSheet.flatten([
                            TextFormat,
                            {
                                color: '#55b2f9',
                                paddingLeft: 2
                            }
                        ])}
                    >
                        Recor
                    </Text>
                    <Text
                        style={StyleSheet.flatten([
                            TextFormat,
                            {
                                color: '#f6be5f',
                                paddingRight: 5
                            }
                        ])}
                    >
                        ding
                    </Text>
                </View>
                <View>
                    <Image
                        style={StyleSheet.flatten([
                            IconFormat,
                            {
                                resizeMode: 'contain',
                                width: 80,
                                marginTop: 0,
                                marginBottom: 40,
                                marginLeft: 5
                            }
                        ])}
                        source={require('../image/pasteRecording.png')}
                    />
                </View>
                <View style={TextViewWithMargin}>
                        <Text 
                            style={StyleSheet.flatten([
                                TextFormat,
                                {
                                    paddingLeft: 12
                                }
                            ])}
                    >
                        Press
                    </Text>
                    <Text
                        style={StyleSheet.flatten([
                            TextFormat,
                            {
                                color: '#55b2f9',
                                paddingLeft: 6
                            }
                        ])}
                    >
                        Se
                    </Text>
                    <Text
                        style={StyleSheet.flatten([
                            TextFormat,
                            {
                                color: '#f6be5f',
                                paddingRight: 5
                            }
                        ])}
                    >
                        nd
                    </Text>
                    <Image
                        style={StyleSheet.flatten([
                            IconFormat,
                            {
                                resizeMode: 'contain',
                                width: 86,
                                marginTop: 16,
                                marginBottom: 15,
                                marginLeft: 0
                            }
                        ])}
                        source={require('../image/sendRecording.png')}
                    />
                </View>
            </View>
        );
    }
}

export default Instructions;
