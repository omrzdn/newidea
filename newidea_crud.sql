

--
-- Database: `newidea_crud`
--
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomid` int(11) NOT NULL,
  `room_name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `room_background` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `room-mic`
--

CREATE TABLE `room-mic` (
  `roomid` int(11) DEFAULT NULL,
  `mic1` tinyint(1) DEFAULT NULL,
  `mic2` tinyint(1) DEFAULT NULL,
  `mic3` tinyint(1) DEFAULT NULL,
  `mic4` tinyint(1) DEFAULT NULL,
  `mic5` tinyint(1) DEFAULT NULL,
  `mic6` tinyint(1) DEFAULT NULL,
  `mic7` tinyint(1) DEFAULT NULL,
  `mic8` tinyint(1) DEFAULT NULL,
  `mic9` tinyint(1) DEFAULT NULL,
  `mic10` tinyint(1) DEFAULT NULL,
  `mic1_usrid` int(11) DEFAULT NULL,
  `mic2_usrid` int(11) DEFAULT NULL,
  `mic3_usrid` int(11) DEFAULT NULL,
  `mic4_usrid` int(11) DEFAULT NULL,
  `mic5_usrid` int(11) DEFAULT NULL,
  `mic6_usrid` int(11) DEFAULT NULL,
  `mic7_usrid` int(11) DEFAULT NULL,
  `mic8_usrid` int(11) DEFAULT NULL,
  `mic9_usrid` int(11) DEFAULT NULL,
  `mic10_usrid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomid`),
  ADD KEY `ownerid` (`ownerid`);

--
-- Indexes for table `room-mic`
--
ALTER TABLE `room-mic`
  ADD KEY `roomid` (`roomid`),
  ADD KEY `mic1_usrid` (`mic1_usrid`),
  ADD KEY `mic2_usrid` (`mic2_usrid`),
  ADD KEY `mic3_usrid` (`mic3_usrid`),
  ADD KEY `mic4_usrid` (`mic4_usrid`),
  ADD KEY `mic5_usrid` (`mic5_usrid`),
  ADD KEY `mic6_usrid` (`mic6_usrid`),
  ADD KEY `mic7_usrid` (`mic7_usrid`),
  ADD KEY `mic8_usrid` (`mic8_usrid`),
  ADD KEY `mic9_usrid` (`mic9_usrid`),
  ADD KEY `mic10_usrid` (`mic10_usrid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `roomid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `room-mic`
--
ALTER TABLE `room-mic`
  ADD CONSTRAINT `room-mic_ibfk_1` FOREIGN KEY (`roomid`) REFERENCES `room` (`roomid`),
  ADD CONSTRAINT `room-mic_ibfk_10` FOREIGN KEY (`mic9_usrid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `room-mic_ibfk_11` FOREIGN KEY (`mic10_usrid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `room-mic_ibfk_2` FOREIGN KEY (`mic1_usrid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `room-mic_ibfk_3` FOREIGN KEY (`mic2_usrid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `room-mic_ibfk_4` FOREIGN KEY (`mic3_usrid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `room-mic_ibfk_5` FOREIGN KEY (`mic4_usrid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `room-mic_ibfk_6` FOREIGN KEY (`mic5_usrid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `room-mic_ibfk_7` FOREIGN KEY (`mic6_usrid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `room-mic_ibfk_8` FOREIGN KEY (`mic7_usrid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `room-mic_ibfk_9` FOREIGN KEY (`mic8_usrid`) REFERENCES `users` (`userid`);
COMMIT;
